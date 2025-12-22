# Ansible-Web-Server-Automation
Infrastructure as Code (IaC) project using Ansible to automate Apache web server provisioning on Rocky Linux.

## 🎯 Objective
To eliminate manual server configuration by implementing Infrastructure as Code (IaC). This project uses Ansible to programmatically provision an Apache (HTTPD) web server on Rocky Linux 9, ensuring consistent deployment standards across the environment.

## 🛠 Skills Applied
- **Infrastructure as Code:** Defined server state (Packages, Services, Content) using YAML playbooks.
- **Ansible Core:** Configured inventory.ini to manage local and remote endpoints.
- **System Administration:** Automated the installation of httpd and firewall configuration on RHEL-based systems.
- **Idempotency:** Designed tasks to check state before execution, preventing redundant changes.

## 💻 Technologies
-  **Tool:** Ansible Core 2.14+
-  **OS:** Rocky Linux 9 (RHEL)
-  **Language:** YAML

## 📝 Project Workflow
### 1. Inventory Configuration
- Defined the target hosts in a static inventory.ini file. For this lab simulation, the scope was restricted to the local controller.
[webservers]
localhost ansible_connection=local

### 2. Playbook Development (install_web.yml)
Wrote a comprehensive playbook to handle the full lifecycle of the web server:
- **Package Management:** Ensures httpd is installed.
- **Service Management:** Ensures the service is started and enabled on boot.
- **Content Delivery:** Deploys a custom index.html to the web root.

### 3. Execution & Verification
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
