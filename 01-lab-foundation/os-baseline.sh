#!/usr/bin/env bash

echo "========================================"
echo "Oracle 19c Lab - OS Baseline"
echo "========================================"
echo

echo "[Hostname]"
hostnamectl
echo

echo "[Oracle Linux release]"
cat /etc/oracle-release
echo

echo "[Kernel]"
uname -r
echo

echo "[IP addresses]"
ip -br addr
echo

echo "[Routing]"
ip route
echo

echo "[NetworkManager devices]"
nmcli device status
echo

echo "[Block devices]"
lsblk -o NAME,SIZE,FSTYPE,MOUNTPOINT
echo

echo "[Mounted filesystems]"
df -hT
echo

echo "[Memory and swap]"
free -h
echo
