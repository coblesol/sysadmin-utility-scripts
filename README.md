# sysadmin-utility-scripts
A collection of PowerShell and Bash scripts designed to automate common system administrator tasks across Windows and Linux environments.

## PowerShell Scripts

### check-service.ps1
Checks whether specified Windows services are running. The script accepts a list of service names and logs each status to `service-status-log.txt` in the same directory. Existing logs are prepended with a header when the file is created.
