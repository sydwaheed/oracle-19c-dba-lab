#!/usr/bin/env bash

HOST_FQDN="${HOST_FQDN:-ora19lab01.lab.local}"
HOST_SHORT="${HOST_SHORT:-ora19lab01}"
HOST_ONLY_IP="${HOST_ONLY_IP:-192.168.56.101}"
NAT_IF="${NAT_IF:-enp0s3}"
HOST_ONLY_IF="${HOST_ONLY_IF:-enp0s8}"

echo "========================================"
echo "Oracle 19c Lab - Network Validation"
echo "========================================"
echo

echo "[Expected lab values]"
echo "FQDN            : $HOST_FQDN"
echo "Short hostname  : $HOST_SHORT"
echo "NAT interface   : $NAT_IF"
echo "Host-only iface : $HOST_ONLY_IF"
echo "Host-only IP    : $HOST_ONLY_IP"
echo

echo "[Interface addresses]"
ip -br addr show "$NAT_IF"
ip -br addr show "$HOST_ONLY_IF"
echo

echo "[Routing]"
ip route
echo

echo "[Active NetworkManager connections]"
nmcli -f NAME,UUID,DEVICE con show --active
echo

echo "[Hostname resolution]"
getent hosts "$HOST_SHORT"
getent hosts "$HOST_FQDN"
echo

echo "[SSH listener]"
ss -lntp | grep ':22' || echo "SSH is not listening on TCP port 22"
echo

if command -v firewall-cmd >/dev/null 2>&1; then
  echo "[Firewall SSH service]"
  firewall-cmd --query-service=ssh
  echo
fi

echo "[Host-only address check]"
if ip -4 addr show "$HOST_ONLY_IF" | grep -q "$HOST_ONLY_IP"; then
  echo "PASS: $HOST_ONLY_IF has $HOST_ONLY_IP"
else
  echo "CHECK: expected $HOST_ONLY_IP was not found on $HOST_ONLY_IF"
fi
