# Part 1 - Lab Foundation

This section contains the reusable validation material for **The Oracle Runbook - Part 1**.

The goal of Part 1 is to build and prove the server foundation before running the Oracle Database installer.

## Lab design

| Item | Value |
| --- | --- |
| Hostname | ora19lab01.lab.local |
| Oracle Linux | 8.10 |
| NAT interface | enp0s3 |
| Host-only interface | enp0s8 |
| Host-only IP | 192.168.56.101/24 |
| /u01 | 80 GB |
| /oradata | 120 GB |
| /fra | 100 GB |

## Files

### os-baseline.sh

Collects the operating system, kernel, memory, network, block device, and filesystem baseline.

### network-validation.sh

Validates the NAT and host-only interfaces, routing, host resolution, SSH listener, and firewall SSH service.

### storage-validation.sh

Validates the Oracle filesystem mounts, labels, fstab entries, filesystem types, capacity, and directory ownership.

### oracle-env.sh

Defines the lab Oracle environment used in the later installation and database creation parts.

## Usage

Run the validation scripts as a user with permission to read the required operating system information.

```bash
chmod +x os-baseline.sh network-validation.sh storage-validation.sh
./os-baseline.sh
./network-validation.sh
./storage-validation.sh
```

Load the Oracle environment with:

```bash
source oracle-env.sh
```

## Safety note

The scripts in this folder do not partition disks or create filesystems. Commands such as `parted` and `mkfs.xfs` modify storage and should only be run after the target devices have been verified.
