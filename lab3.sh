#!/bin/bash

# Define server names and IPs
SERVER1="server1-mgmt"
SERVER2="server2-mgmt"
SERVER1_IP="192.168.16.3"
SERVER2_IP="192.168.16.4"
REMOTE_USER="remoteadmin"

# Check for verbose flag
verbose=false
if [[ "$1" == "-verbose" ]]; then
    verbose=true
    shift  # Shift the argument to remove -verbose
fi

# Function to configure the remote server
configure_remote_server() {
    local server=$1
    local ip=$2
    local name=$3

    echo "Configuring $server ($ip) with hostname $name..."

    # Transfer the configure-host.sh script to the remote server
    scp configure-host.sh "$REMOTE_USER@$server:/root/"

    # Run the configure-host.sh script on the remote server
    ssh "$REMOTE_USER@$server" "/root/configure-host.sh -name $name -ip $ip -hostentry loghost 192.168.16.3 -hostentry webhost 192.168.16.4 $(if $verbose; then echo '-verbose'; fi)"
}

# Configure server 1 (loghost)
configure_remote_server $SERVER1 $SERVER1_IP "loghost"

# Configure server 2 (webhost)
configure_remote_server $SERVER2 $SERVER2_IP "webhost"

# Configure the local machine to update /etc/hosts with both entries
echo "Configuring local machine's /etc/hosts file..."
./configure-host.sh -hostentry loghost 192.168.16.3 -hostentry webhost 192.168.16.4 $(if $verbose; then echo '-verbose'; fi)

echo "Configuration complete!"
