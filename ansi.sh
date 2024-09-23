#!/bin/bash

# Load environment variables from .env file
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
else
    echo ".env file not found!"
    exit 1
fi

# Run Ansible playbook with the loaded variables
ansible-playbook ./playbook/docker-playbook.yml \
  --extra-vars "the_ip=${MACHINE_IP} the_user=${MACHINE_USER} the_key_path=${SSH_PRIVATE_KEY_PATH}"
