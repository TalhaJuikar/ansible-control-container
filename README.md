# Ansible Control Container

A lightweight, containerized Ansible control node built on Alpine Linux for managing infrastructure through Ansible.

## Overview

This project provides a containerized Ansible environment that allows you to run Ansible playbooks without installing Ansible directly on your host system. The container includes:

- Ansible and Ansible-lint
- Python 3 with virtual environment
- SSH client and supporting tools
- Git for version control
- Convenient utilities (vim, bash, etc.)

## Usage

### Quick Start

```bash
# Clone this repository
git clone https://github.com/talhajuikar/ansible-control-container.git
cd ansible-control-container

# Start the container
docker compose up -d

# Access the container shell
docker exec -it ansible-control bash
```

## Configuration

### Volume Mounts

The docker-compose.yaml file includes several optional volume mounts that you can uncomment as needed:

- SSH keys: `~/.ssh:/root/.ssh:ro`
- Ansible playbooks: `./playbooks:/workspace/playbooks`
- Inventory files: `./inventory:/etc/ansible/inventory:ro`
- Ansible config: `./ansible.cfg:/etc/ansible/ansible.cfg:ro`

### Environment Variables

- `ANSIBLE_HOST_KEY_CHECKING=False`: Disables SSH host key checking
- `ANSIBLE_CONFIG=/etc/ansible/ansible.cfg`: Sets the location for Ansible configuration
- `TZ=UTC`: Sets timezone
