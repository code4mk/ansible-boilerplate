```bash
cd credentials
ssh-keygen -t rsa -b 2048 -f "$(pwd)/ansible_hub_key"
```

```bash
ssh -i ./ansible_hub_key root@167.172.25.133
```
