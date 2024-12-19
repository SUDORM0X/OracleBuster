# OracleBuster
A highly configurable Bash script for testing the security of Oracle databases by attempting combinations of IPs, ports, SIDs, usernames, and passwords. This tool is for ethical hacking and authorized penetration testing only.




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
## How to Use

### Prerequisites
1. Install the Oracle SQL*Plus client (`sqlplus`).
2. Obtain explicit authorization to test the target systems.



Create the following input files in the same directory as the script. Each file should have one entry per line.

1. ip_list.txt (Target IP addresses)
```plaintext
192.168.1.1
10.0.0.2
```

2. port_list.txt (Target Oracle database ports)
```
1521
1522
```

3. sid.txt (Oracle System Identifiers - SIDs)
```
ORCL
XE
```

4. users.txt (Database usernames)
```
admin
sys
scott
```

5. passwords.txt (Database passwords)
```
oracle
admin
password123
```



Step 6: Review the Results
After the script completes, review the following output files for results:

success.txt: Contains details of successful login attempts. Example:

```
Trovato: IP=192.168.1.1, Porta=1521, SID=XE, USER=admin, PASS=oracle
```





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


