# Born2beRoot

## Project Overview

This project was a system administration exercise where a virtual machine (VM) running Debian was created and configured while adhering to strict security protocols and system configuration guidelines. The project taught essential server administration tasks, including setting up a server, configuring system services, securing the environment, and writing basic automation scripts for monitoring.

## Project Components

### 1. Virtual Machine Setup
- **VM Creation**: A VirtualBox VM running the latest stable version of Debian was set up.
- **Disk Partitioning**: Encrypted partitions were configured using LVM (Logical Volume Management).

### 2. System Configuration
- **User Setup**: A user with restricted sudo permissions was created, added to the sudo and user42 groups, and a strong password policy was enforced.
- **SSH Configuration**: The SSH service was set to run on port 4242, with root login disabled for enhanced security.
- **Firewall**: UFW was configured to only allow incoming connections on port 4242.
- **Password Policy**: A strong password policy was enforced, including password expiration, complexity rules, and minimum length.
- **Sudo Configuration**: Sudo was configured to limit authentication attempts and log sudo commands.

### 3. Monitoring Script
- **Bash Script**: A monitoring script (`monitoring.sh`) was created to run at startup and display system statistics such as:
  - OS architecture and kernel version
  - CPU and memory usage
  - Disk utilization
  - Active connections and users
  - Last reboot date
  - IPv4 and MAC addresses
  - Sudo command usage
  
  The script ran every 10 minutes and displayed this information on all terminals.

### 4. Security
- **AppArmor**: AppArmor was configured to enhance security through access control policies.
- **UFW**: UFW was installed and configured to only allow traffic on port 4242.
- **SSH Hardening**: Root login via SSH was disabled and SSH was set up on a non-standard port (4242).
- **Firewall Management**: UFW was set up to block all ports except port 4242, enhancing system security.

## Project Peer Evaluation

The peer evaluation process focused on reviewing the virtual machine's configuration to ensure all project requirements were met and that a solid understanding of the subject was demonstrated. This included verifying system configuration, monitoring script functionality, and the implementation of security measures such as user management, firewall, and SSH settings.


