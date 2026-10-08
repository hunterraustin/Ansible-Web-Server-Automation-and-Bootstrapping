#!/bin/bash
# Bootstrap: confirm root, install Ansible if it's missing, then run the playbook.
cd "$(dirname "$0")" || exit 1

if [ "$EUID" -ne 0 ]; then
  echo "Run this script as root: sudo bash setup.sh"
  exit 1
fi

if ! command -v ansible-playbook &> /dev/null; then
  echo "Ansible not found. Installing ansible-core..."
  dnf install -y ansible-core
fi

ansible-playbook -i inventory.ini install_web.yml
