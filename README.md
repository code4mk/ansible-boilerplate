# Ansible Boilerplate
A production-ready Ansible boilerplate for automated server provisioning

## Clone the repository

```bash
git clone https://github.com/code4mk/ansible-boilerplate.git
```

## Setup environment variables

```bash
cp .env.example .env
```

## Usage

```bash
./deploy.sh <playbook_name> [additional_vars]
```

## List available playbooks

```bash
./deploy.sh
```

## folder structure
```bash
.
├── credentials/
│   └── README.md
├── hosts/
│   └── inventory.ini
├── playbook/
│   ├── docker-playbook.yml
│   └── nginx-playbook.yml
├── roles/
│   ├── docker/
│   └── nginx/
├── .env
├── .gitignore
├── README.md
├── ansible.cfg
└── deploy.sh
```

## docs
* [credentials management](credentials/README.md)