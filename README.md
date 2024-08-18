# DevOpsFetch
DevOpsFetch is a Bash script designed to provide system information retrieval and monitoring capabilities. It offers functionalities to view active ports, Docker information, Nginx configurations, user details, and system activities within a specified time range.

#### File structure
.
├── README.md
├── devopsfetch
├── docker-install.sh
└── install.sh

## Steps:

1. Clone the repository:
```sh
git clone https://github.com/Rob-in-son/devopsfetch-tool.git
cd devopsfetch-tool
```

2. Run the installation script:
```sh
./install.sh
```

### Note: The installation script will:

- Prompt for confirmation before proceeding.
- Install required dependencies (apt-get, jq, nginx).
- Copy the devopsfetch script to /usr/local/bin.
- Grant execute permission to the script.
- Create a log directory (/var/log/devopsfetch).
- Create a systemd service file for devopsfetch.
- Set up log rotation for the service.
- Reload systemd, enable, and start the service.

## Usage
DevOpsFetch is run from the command line with optional arguments:

### Available Options:

- ```-p, --ports```: Display active ports and services.
- ```-p <port_number>```: Show details for a specific port.
- ```-d, --docker```: List Docker images and containers.
- ```-d <container_name>```: Show details for a specific container.
- ```-n, --nginx```: Display Nginx configurations.
- ```-n <domain>```: Show details for a specific domain.
- ```-u, --users```: List users and their last login times.
- ```-u <username>```: Show details for a specific user.
- ```-t, --time```: Display activities within a specified time range.
    Usage: devopsfetch ```-t YYYY-MM-DD [YYYY-MM-DD]```: Specify start and optional end date.
- ```-h, --help```: Display help information.
