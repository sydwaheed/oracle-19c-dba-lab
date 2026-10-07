# Oracle 19c DBA Lab

> A hands-on Oracle Database 19c learning environment built to document practical DBA work from the operating system layer through database administration, patching, recovery, Data Guard, performance, security, and troubleshooting.

This repository is the technical companion to **The Oracle Runbook** by **Syed Waheeduddin Hussaini**.

---

## Lab baseline

| Item | Lab value |
| --- | --- |
| **VM name** | `ora19lab01` |
| **Hostname** | `ora19lab01.lab.local` |
| **Guest operating system** | Oracle Linux Server 8.10 |
| **CPU** | 4 vCPU |
| **Memory** | 10 GB |
| **Network adapter 1** | NAT |
| **Network adapter 2** | Host-only |
| **Host-only address** | `192.168.56.101/24` |
| **OS disk** | 80 GB |
| **/u01 disk** | 80 GB |
| **/oradata disk** | 120 GB |
| **/fra disk** | 100 GB |
| **Oracle Database base software** | 19c 19.3 |
| **CDB** | `LABCDB` |
| **PDB** | `LABPDB1` |

---

## The Oracle Runbook

| Part | Topic | Repository section |
| --- | --- | --- |
| **Part 1** | Oracle Linux, VirtualBox, networking, storage, and OS preparation | [01-lab-foundation](01-lab-foundation/) |
| **Part 2** | Oracle Database 19c software installation | [02-oracle-installation](02-oracle-installation/) |
| **Part 3** | Listener, CDB, and PDB creation | [03-cdb-pdb-creation](03-cdb-pdb-creation/) |
| **Part 4** | Oracle Database 19c Release Update patching | [04-ru-patching](04-ru-patching/) |

---

## Part 1 companion files

The first section contains reusable validation scripts from the lab build.

- [`os-baseline.sh`](01-lab-foundation/os-baseline.sh)
- [`network-validation.sh`](01-lab-foundation/network-validation.sh)
- [`storage-validation.sh`](01-lab-foundation/storage-validation.sh)
- [`oracle-env.sh`](01-lab-foundation/oracle-env.sh)

> **Safety note**  
> The repository is intentionally validation focused. Destructive disk operations such as partition creation and filesystem formatting are not automated.

---

## Published article

### The Oracle Runbook - Part 1

**Building an Oracle 19c DBA Lab from Scratch on Oracle Linux 8.10**

[Read the article on Medium](https://medium.com/@sydwaheed/oracle-19c-dba-lab-oracle-linux-8-10-093abb9f0edf)

Medium profile: [@sydwaheed](https://medium.com/@sydwaheed)

---

## Repository notes

This is a personal learning lab and not a production sizing guide. Always validate current Oracle certification and Release Update requirements before using a similar configuration outside a lab.

No Oracle software, patch binaries, passwords, wallet files, or confidential environment data are stored in this repository.
