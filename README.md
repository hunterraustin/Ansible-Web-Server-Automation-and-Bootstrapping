# Ansible Web Server Automation & Bootstrapping
Infrastructure as Code (IaC) project utilizing Ansible and Bash scripting to automate Apache web server provisioning and environment bootstrapping.

## 🎯 Objective
To eliminate manual server configuration by implementing **Infrastructure as Code (IaC)**. This project uses **Ansible playbooks** for configuration management and **Bash scripting** for environment bootstrapping to provision an Apache (HTTPD) web server on Rocky Linux 9.

## 🛠 Skills Applied
- **Infrastructure as Code:** Defined server state (Packages, Services, Content) using YAML playbooks.
- **Shell Scripting:** Developed Bash scripts to automate environment pre-flight checks (Root/Dependency validation).
- **Ansible Core:** Configured `inventory.ini` to manage local and remote endpoints.
- **System Administration:** Automated the installation of `httpd` and firewall configuration on RHEL-based systems.

## 💻 Technologies
-  **Tool:** Ansible Core 2.14+
-  **OS:** Rocky Linux 9 (RHEL)
-  **Language:** YAML

## 📝 Project Workflow
### 1. Inventory Configuration
- Defined the target hosts in a static inventory.ini file. For this lab simulation, the scope was restricted to the local controller.
```ini
[webservers]
localhost ansible_connection=local
```

### 2. Playbook Development (install_web.yml)
Wrote a comprehensive playbook to handle the full lifecycle of the web server:
- **Package Management:** Ensures httpd is installed.
- **Service Management:** Ensures the service is started and enabled on boot.
- **Content Delivery:** Deploys a custom index.html to the web root.

### 3. Automation Bootstrapping (Bash)
Created a `setup.sh` wrapper script to handle enviroment pre-flight checks. This cript ensures the user has root privileges and automatically installs Ansible if it is missing, preventing execution failures. 

```bash
#!/bin/bash
# 1. Safety Check: Ensure the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "❌ Error: Please run as root"
  exit 1
fi

# 2. Dependency Check: Install Ansible if missing
if ! command -v ansible &> /dev/null; then
    echo "⚙️ Ansible not found. Installing..."
    dnf install ansible-core -y
fi

# 3. Execution: Run the Playbook
echo "🚀 Starting Automation..."
ansible-playbook -i inventory.ini install_web.yml
```

### 4. Execution & Verification
Ran the playbook using ansible-playbook. The script successfully detected the missing service, installed it, and deployed the website content without manual intervention.

![Playbook Execution Output](playbook_run.png)

*Verification of the hosted site:*

![Website Verification](web_verify.png)

## 📂 Project Files
- [install_web.yml]: The main Ansible playbook containing the automation logic.
- [inventory.ini]: The host definition file.

## 📚 References & Resources
This project was built following industry-standard automation practices:
 - **Ansible Setup on RHEL/Rocky:** [How to install Ansible in Rocky Linux 9](https://youtu.be/Cj9TOEGtbfM?si=5liUx0upLZoFTnud)
 - **Playbook Fundamentals:** [Ansible Playbook Beginners Tutorial](https://youtu.be/FZ8400kGa_4?si=SRZ9wm_7Il-XSqjY)
