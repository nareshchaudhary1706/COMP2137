#!/bin/bash

# Ensure the script is run as root
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root" >&2
  exit 1
fi

echo "Starting the configuration..."

# Step 1: Configure the network
echo "Configuring network..."
# Set the IP address using netplan
netplan apply

# Step 2: Install Apache2
echo "Installing Apache2..."
apt update
apt install -y apache2

# Step 3: Install Squid
echo "Installing Squid..."
apt install -y squid

# Step 4: Configure user accounts
echo "Creating user accounts..."
useradd -m -s /bin/bash dennis
useradd -m -s /bin/bash aubrey
useradd -m -s /bin/bash captain
# Repeat user creation for all other users

# Step 5: Add SSH keys for each user
echo "Adding SSH keys for users..."
mkdir -p /home/dennis/.ssh
echo "ssh-ed25519 AAAAC3... student@generic-vm" > /home/dennis/.ssh/authorized_keys

# Repeat for other users

# Step 6: Make sure sudo access for 'dennis'
usermod -aG sudo dennis

# Step 7: Set up /etc/hosts
echo "Configuring /etc/hosts..."
echo "192.168.16.21 server1" >> /etc/hosts

echo "Configuration complete!"
