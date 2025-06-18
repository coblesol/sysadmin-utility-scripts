# sysadmin-utility-scripts

This repository contains PowerShell and Bash scripts for automating routine system administration tasks on Windows and Linux.

---

## 🔧 PowerShell Scripts

### `check-service.ps1`
Checks the status of one or more Windows services and logs the results to a local log file.

**Features:**
- Accepts a list of service names
- Displays status in the terminal
- Logs results with timestamps to `service-status-log.txt`
- Adds a header to the log when the file is first created

**Usage:**
```powershell
.\check-service.ps1 -ServiceNames "Spooler","wuauserv"
