#!/bin/bash

# Check if the script is running as root
if [ "$(id -u)" != "0" ]; then
  echo "This script requires root privileges. Please run with sudo or run as root"
  exit 1
fi

# Function to check if a command was successful
check_success() {
    if [ $? -ne 0 ]; then
        echo "Error: $1"
        exit 1
    fi
}

# Prompt user before proceeding
read -p "This script will install DevOpsFetch and its dependencies. Do you want to continue? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
fi

# Install dependencies
apt-get update
check_success "Failed to update package list"
# Run custom Docker installation script
./docker-install.sh
check_success "Failed to install Docker using custom script"
apt-get install -y jq nginx
check_success "Failed to install dependencies"


# Copy devopsfetch script to /usr/local/bin
cp devopsfetch /usr/local/bin/
check_success "Failed to copy devopsfetch script"

# Grant execute permission
chmod +x /usr/local/bin/devopsfetch
check_success "Failed to set execute permission"

# Create log directory
mkdir -p /var/log/devopsfetch
check_success "Failed to create log directory"

# Create systemd service file
cat << EOF > /etc/systemd/system/devopsfetch.service
[Unit]
Description=DevOpsFetch Monitoring Service
After=network.target

[Service]
ExecStart=/usr/local/bin/devopsfetch 
StandardOutput=append:/var/log/devopsfetch/devopsfetch.log
StandardError=append:/var/log/devopsfetch/devopsfetch.log
Restart=always
User=root

[Install]
WantedBy=multi-user.target
EOF
check_success "Failed to create systemd service file"

# Set up log rotation
cat << EOF > /etc/logrotate.d/devopsfetch
/var/log/devopsfetch/devopsfetch.log {
    daily
    rotate 7
    compress
    delaycompress
    missingok
    notifempty
    create 644 root root
}
EOF
check_success "Failed to set up log rotation"

# Reload systemd, enable and start the service
systemctl daemon-reload
check_success "Failed to reload systemd"
systemctl enable devopsfetch.service
check_success "Failed to enable devopsfetch service"
systemctl start devopsfetch.service
check_success "Failed to start devopsfetch service"

echo "Installation complete. DevOpsFetch is now running as a systemd service."
echo "Logs are stored in /var/log/devopsfetch/devopsfetch.log"
echo "Use 'systemctl status devopsfetch' to check the service status."