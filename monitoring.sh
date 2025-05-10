#!/bin/bash

#System arc
architecture=$(uname -a) 

#CPU physical
cpu=$(grep "physical id" /proc/cpuinfo | sort -u | wc -l)

#CPU virtual
vcpu=$(nproc) 

#Memory Usage
ram_total=$(free -m | grep '^Mem:' | awk '{print $2}') 
ram_usage=$(free -m | grep '^Mem:' | awk '{print $3}') 
ram_percentage=$(awk "BEGIN {print sprintf(\"%.2f\", ($ram_usage/$ram_total)*100)}")

#Disk Usage
disk_total=$(df --block-size=1M /  | grep '^/' | awk '{print $4}') 
disk_total_gb=$(df --block-size=G /  | grep '^/' | awk '{print $4}') 
disk_usage=$(df --block-size=1M / | grep '^/' | awk '{print $3}')
disk_percentage=$(awk "BEGIN {print int(($disk_usage/$disk_total)*100)}")

#CPU load
cpu_idle=$(vmstat 1 2 | tail -1 | awk '{print $15}') 
cpu_usage=$(awk "BEGIN {printf \"%.1f\", 100 - $cpu_idle}")

#Last boot
last_boot=$(who -b | awk '{print $3, $4}')

#LVM use
lvm=$(lsblk -o NAME,TYPE | grep -q "lvm" && echo "yes" || echo "no")

#Connections TCP
connections_tcp=$(ss -t -a | grep ESTAB | wc -l)

#User log
users=$(who | wc -l)

#Network
ip_address=$(ip -4 addr show scope global | awk '/inet/ {print $2}' | cut -d/ -f1 | head -n1)
mac_address=$(ip link show | awk '/ether/ {print $2}' | head -n1)

#Sudo
sudo_commands=$(journalctl _COMM=sudo | grep COMMAND | wc -l)

#Output
{
echo "#Architecture: $architecture"
echo "#CPU physical : $cpu"
echo "#vCPU: $vcpu"
echo "#Memory Usage: $ram_usage/${ram_total}MB (${ram_percentage}%)"
echo "#Disk Usage: ${disk_usage}/${disk_total_gb}b (${disk_percentage}%)"
echo "#CPU load: ${cpu_usage}%"
echo "#Last boot: ${last_boot}"
echo "#LVM use: ${lvm}"
echo "#Connections TCP: ${connections_tcp} ESTABLISHED"
echo "#User log: ${users}"
echo "#Network: IP ${ip_address} (${mac_address})"
echo "#Sudo: ${sudo_commands} cmd"
} | wall