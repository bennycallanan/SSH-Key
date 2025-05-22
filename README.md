# Brendan's SSH Key

A utility script for managing SSH key installation and removal on client machines.

## Overview
This script provides a simple way to install and remove SSH keys from client machines, ensuring secure and convenient access to remote systems.

## Prerequisites
- Bash shell
- `curl` command-line tool
- Internet connection

## Installation
To install the SSH key, run the following command in your terminal:

```bash
bash <(curl -s https://raw.githubusercontent.com/bennycallanan/SSH-Key/master/brendans-key.sh)
```

This will automatically download and execute the installation script.

## Usage
The script will:
1. Download and install the SSH key
2. Set appropriate permissions
3. Add the key to the authorized_keys file

## Security
- The script uses HTTPS for secure download
- SSH keys are installed with proper permissions
- The installation process is transparent and can be verified

## Support
If you encounter any issues during installation, please contact the repository owner.
