# SSH Key Management for Ansible

This guide explains how to set up and manage SSH keys for Ansible automation.

## Generate SSH Key

Run these commands from the project root:

```bash
cd credentials
ssh-keygen -t rsa -b 2048 -f "$(pwd)/ansible_hub_key"
```

This will create:
- `ansible_hub_key` (private key)
- `ansible_hub_key.pub` (public key)

## Key Usage

### Test SSH Connection
```bash
ssh -i ./ansible_hub_key root@your-server-ip
```

### Setup Steps

1. Copy the public key to your target server:
   ```bash
   ssh-copy-id -i ./ansible_hub_key.pub root@your-server-ip
   ```

2. Set proper permissions:
   ```bash
   chmod 600 ansible_hub_key
   ```

3. Update your `.env` file with the correct path:
   ```
   SSH_PRIVATE_KEY_PATH=./credentials/ansible_hub_key
   ```


## Using AWS PEM Key

If you're using an AWS EC2 instance:

1. Place your `.pem` key file in the credentials directory:
   ```bash
   cp /path/to/your-aws-key.pem ./credentials/
   ```

2. Set proper permissions:
   ```bash
   chmod 400 ./credentials/your-aws-key.pem
   ```

3. Update your `.env` file with the PEM key path:
   ```
   SSH_PRIVATE_KEY_PATH=./credentials/your-aws-key.pem
   ```

4. Test the connection:
   ```bash
   ssh -i ./credentials/your-aws-key.pem ubuntu@your-ec2-ip
   ```