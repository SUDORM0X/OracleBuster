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


# OracleBuster

## Overview
**OracleBuster** is a powerful and customizable Bash script designed to test the security of Oracle databases. By automating brute-force testing, it identifies potential vulnerabilities in IPs, ports, SIDs, usernames, and passwords.

> **Disclaimer:** This tool is for **ethical hacking**, **authorized penetration testing**, and **educational purposes only**. Unauthorized use is strictly prohibited and may violate laws and regulations.

---

## Features
- **Customizable Input Files**: Easily provide IPs, ports, SIDs, usernames, and passwords via text files.
- **Timeout Configuration**: Avoid wasting time on unresponsive hosts by setting a timeout for each connection.
- **Error and Success Logging**: Detailed logs of successful logins and connection issues.
- **Modular Design**: Easily extend or modify for additional use cases.

---

## File Structure
Here's what your project directory will look like:

```plaintext
OracleBuster/
│
├── OracleBuster.sh         # Main script
├── ip_list.txt             # List of target IPs
├── port_list.txt           # List of target ports
├── sid.txt                 # List of Oracle SIDs
├── users.txt               # List of usernames
├── passwords.txt           # List of passwords
├── success.txt             # Logs of successful attempts
├── errors.txt              # Logs of errors and timeouts
├── README.md               # Project documentation
└── LICENSE                 # License information
