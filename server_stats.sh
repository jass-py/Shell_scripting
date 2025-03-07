#!/bin/bash

# Server Performance Stats Script

# Get current date and time
DATE=$(date +"%Y-%m-%d %H:%M:%S")

# CPU Usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')

# Memory Usage
MEM_USAGE=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')

# Disk Usage
DISK_USAGE=$(df -h / | awk 'NR==2{print $5}')

# Network Activity (replace eth0 with your network interface)
NETWORK_RX=$(cat /sys/class/net/eth0/statistics/rx_bytes)
NETWORK_TX=$(cat /sys/class/net/eth0/statistics/tx_bytes)

# Uptime
UPTIME=$(uptime -p)

# Output the stats
echo "==========================================="
echo "Server Performance Stats - $DATE"
echo "==========================================="
echo "CPU Usage: $CPU_USAGE"
echo "Memory Usage: $MEM_USAGE"
echo "Disk Usage: $DISK_USAGE"
echo "Network RX: $NETWORK_RX bytes"
echo "Network TX: $NETWORK_TX bytes"
echo "Uptime: $UPTIME"
echo "==========================================="