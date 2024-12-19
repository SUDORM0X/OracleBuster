# OracleBuster
A highly configurable Bash script for testing the security of Oracle databases by attempting combinations of IPs, ports, SIDs, usernames, and passwords. This tool is for ethical hacking and authorized penetration testing only.


## Overview
**OracleBuster** is a Bash-based tool designed to identify potential vulnerabilities in Oracle databases through brute-force testing. It automates the process of attempting various combinations of IPs, ports, SIDs, usernames, and passwords.

**Important:** This tool is intended for ethical hacking, security assessments, and authorized penetration testing only.

---

## Features
- Customizable input files for easy testing.
- Connection timeout to avoid wasting time on unresponsive hosts.
- Logs successful attempts and errors for review.

---

## How to Use

### Prerequisites
1. Install the Oracle SQL*Plus client (`sqlplus`).
2. Obtain explicit authorization to test the target systems.

### Input Files
Prepare the following files in the project directory:

- **`ip_list.txt`**: Target IP addresses (one per line).
  ```plaintext
  192.168.1.1
  10.0.0.2
