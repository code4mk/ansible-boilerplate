#!/bin/bash

# Load environment variables from .env file
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
else
    echo ".env file not found!"
    exit 1
fi

# List available playbooks
list_playbooks() {
    echo "Available playbooks:"
    ls ./playbook/*-playbook.yml | sed 's/.*\/\(.*\)-playbook.yml/\1/'
}

# Show usage
usage() {
    echo "Usage: $0 [playbook_name] [additional_vars]"
    echo "Example: $0 docker"
    echo "Example: $0 nginx environment=production"
    list_playbooks
    exit 1
}

# Check if playbook name is provided
if [ -z "$1" ]; then
    usage
fi

PLAYBOOK_NAME="$1"
PLAYBOOK_FILE="./playbook/${PLAYBOOK_NAME}-playbook.yml"

# Check if playbook exists
if [ ! -f "$PLAYBOOK_FILE" ]; then
    echo "Error: Playbook ${PLAYBOOK_FILE} not found!"
    list_playbooks
    exit 1
fi

# Run Ansible playbook with the loaded variables
ansible-playbook "$PLAYBOOK_FILE" \
    --extra-vars "the_ip=${MACHINE_IP} the_user=${MACHINE_USER} the_key_path=${SSH_PRIVATE_KEY_PATH}" \
    ${@:2}
