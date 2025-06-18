# Check-Service.ps1
# This script checks the status of one or more Windows services
# and logs the results to a text file.
# Usage example:
#   .\check-service.ps1 -ServiceNames "Spooler","wuauserv"

param(
    [Parameter(Mandatory=$true)]
    [string[]]$ServiceNames
)

# Path to the log file
$LogFile = Join-Path -Path $PSScriptRoot -ChildPath 'service-status-log.txt'

if (-not (Test-Path $LogFile)) {
    Add-Content -Path $LogFile -Value "`n===== Service Check Log - $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') =====`n"
}
Write-Host "Checking service status..." -ForegroundColor Cyan

foreach ($name in $ServiceNames) {
    # Attempt to get the service. Suppress errors if it doesn't exist
    $service = Get-Service -Name $name -ErrorAction SilentlyContinue

    if ($null -eq $service) {
        $statusMessage = "not installed"
    } elseif ($service.Status -eq 'Running') {
        $statusMessage = "running"
    } else {
        $statusMessage = "stopped"
    }

    # Compose a log line with timestamp, service name, and status
    $logLine = "{0} {1} : {2}" -f (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'), $name, $statusMessage

    # Output to console
    Write-Host $logLine

    # Append the line to the log file
    Add-Content -Path $LogFile -Value $logLine
}

Write-Host "Results have been logged to $LogFile" -ForegroundColor Green
