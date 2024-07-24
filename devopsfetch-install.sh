# Check if the script is running as root
if [ "$(id -u)" != "0" ]; then
  echo "This script requires root privileges. Please run with sudo or run as root"
  exit 1
fi

# Install dependencies
apt-get update
./docker.sh
apt-get install -y jq nginx 


# Copy devopsfetch script to /usr/local/bin
cp devopsfetch /usr/local/bin/

# Grant execute permission
chmod +x /usr/local/bin/devopsfetch

# Create log directory
mkdir -p /var/log/devopsfetch

# Create systemd service file
cat << EOF > /etc/systemd/system/devopsfetch.service
[Unit]
Description=DevOpsFetch Monitoring Service
After=network.target

[Service]
ExecStart=/usr/local/bin/devopsfetch --time $(date +%Y-%m-%d)
StandardOutput=append:/var/log/devopsfetch/devopsfetch.log
StandardError=append:/var/log/devopsfetch/devopsfetch.log
Restart=always
User=root

[Install]
WantedBy=multi-user.target
EOF

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

# Reload systemd, enable and start the service
systemctl daemon-reload
systemctl enable devopsfetch.service
systemctl start devopsfetch.service

echo "Installation complete. DevOpsFetch is now running as a systemd service."
echo "Logs are stored in /var/log/devopsfetch/devopsfetch.log"
echo "Use 'systemctl status devopsfetch' to check the service status."