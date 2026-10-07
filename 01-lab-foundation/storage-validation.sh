#!/usr/bin/env bash

MOUNTS=(/u01 /oradata /fra)

echo "========================================"
echo "Oracle 19c Lab - Storage Validation"
echo "========================================"
echo

echo "[Block devices and filesystem labels]"
lsblk -f
echo

echo "[Oracle filesystem capacity]"
df -hT "${MOUNTS[@]}"
echo

echo "[Mount sources]"
for mount_point in "${MOUNTS[@]}"; do
  findmnt "$mount_point" || echo "CHECK: $mount_point is not mounted"
done
echo

echo "[fstab Oracle filesystem entries]"
grep -E 'LABEL=(U01|ORADATA|FRA)' /etc/fstab || echo "CHECK: expected LABEL entries were not found"
echo

echo "[Directory ownership and permissions]"
for mount_point in "${MOUNTS[@]}"; do
  if [ -d "$mount_point" ]; then
    stat -c '%n  owner=%U  group=%G  mode=%A' "$mount_point"
  else
    echo "CHECK: $mount_point does not exist"
  fi
done
