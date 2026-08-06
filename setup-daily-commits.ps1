# Setup Daily Git Commits - Run as Administrator
# This script creates a scheduled task for daily Git commits

Write-Host "Setting up daily Git commits..." -ForegroundColor Green
Write-Host "Note: This script requires Administrator privileges" -ForegroundColor Yellow

# Check if running as administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $isAdmin) {
    Write-Host "This script must be run as Administrator." -ForegroundColor Red
    Write-Host "Right-click PowerShell and select 'Run as Administrator'" -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 1
}

# Create the scheduled task action
$action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-ExecutionPolicy Bypass -File `"C:\MyJScode\daily-git-commit.ps1`""

# Create the trigger (daily at 9 PM)
$trigger = New-ScheduledTaskTrigger -Daily -At "9:00PM"

# Register the scheduled task
try {
    Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "Python Learning Journey Daily Git Commit" -Description "Daily automatic Git commit for Python learning repository" -User "System" -ErrorAction Stop
    
    Write-Host "Scheduled task created successfully!" -ForegroundColor Green
    Write-Host "Task Name: Python Learning Journey Daily Git Commit" -ForegroundColor Cyan
    Write-Host "Schedule: Daily at 9:00 PM" -ForegroundColor Cyan
    Write-Host "Script: C:\MyJScode\daily-git-commit.ps1" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "To modify the schedule, open Task Scheduler and find 'Python Learning Journey Daily Git Commit'" -ForegroundColor Yellow
} catch {
    Write-Host "Failed to create scheduled task: $_" -ForegroundColor Red
    Write-Host "You may need to manually create the task in Task Scheduler" -ForegroundColor Yellow
}

Read-Host "Press Enter to exit"