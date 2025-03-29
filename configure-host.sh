#!/bin/bash

# Function to update the hostname
update_hostname() {
    local desired_name=$1
    # Check if the current hostname is different from the desired hostname
    if [[ $(hostname) != "$desired_name" ]]; then
        # Update the /etc/hostname file and apply the new hostname
        echo "$desired_name" > /etc/hostname
        hostnamectl set-hostname "$desired_name"
        
        # If verbose flag is set, print the change
        if [ "$verbose" == true ]; then
            echo "Hostname updated to $desired_name"
        fi
        # Log the change to the system log
        logger "Hostname updated to $desired_name"
    fi
}

# Function to update the IP address
update_ip() {
    local desired_ip=$1
    # Check if the IP address is already set
    if ! grep -q "$desired_ip" /etc/netplan/*.yaml; then
        # Update /etc/netplan configuration for the IP address
        sed -i "s/addresses: .*/addresses: [$desired_ip\/24]/" /etc/netplan/*.yaml
        netplan apply
        
        # If verbose flag is set, print the change
        if [ "$verbose" == true ]; then
            echo "IP address updated to $desired_ip"
        fi
        # Log the change
        logger "IP address updated to $desired_ip"
    fi
}

# Function to update /etc/hosts
update_hosts() {
    local entry_name=$1
    local entry_ip=$2
    # Check if the entry is already in /etc/hosts
    if ! grep -q "$entry_ip" /etc/hosts; then
        # Add the new entry to /etc/hosts
        echo "$entry_ip $entry_name" >> /etc/hosts
        
        # If verbose flag is set, print the change
        if [ "$verbose" == true ]; then
            echo "Added $entry_name with IP $entry_ip to /etc/hosts"
        fi
        # Log the change
        logger "Added $entry_name with IP $entry_ip to /etc/hosts"
    fi
}

# Initialize the verbose flag
verbose=false

# Parse the command-line arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        -verbose)
            verbose=true
            shift
            ;;
        -name)
            name="$2"
            shift 2
            ;;
        -ip)
            ip="$2"
            shift 2
            ;;
        -hostentry)
            entry_name="$2"
            entry_ip="$3"
            shift 3
            ;;
        *)
            echo "Invalid option: $1"
            exit 1
            ;;
    esac
done

# Apply the desired changes based on the arguments
if [[ -n "$name" ]]; then
    update_hostname "$name"
fi

if [[ -n "$ip" ]]; then
    update_ip "$ip"
fi

if [[ -n "$entry_name" && -n "$entry_ip" ]]; then
    update_hosts "$entry_name" "$entry_ip"
fi
