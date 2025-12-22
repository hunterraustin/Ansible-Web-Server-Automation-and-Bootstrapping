#!/bin/bash
# 1. Check for Root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

# 2. Check/Install Ansible
if ! command -v ansible &> /dev/null; then
    echo "Installing Ansible..."
    dnf install ansible-core -y
fi

# 3. Run Playbook
ansible-playbook -i inventory.ini install_web.yml