# Daily Git Commit Script for Python Learning Journey
# This script commits daily changes to Git
# Account: 2Tu12031978@gmail.com

Write-Host "Starting daily Git commit..." -ForegroundColor Green

# Navigate to the project directory
Set-Location "C:\MyJScode"

# Get the Git executable path
$gitPath = "C:\Users\2TU\AppData\Local\Programs\Git\cmd\git.exe"

# Check if there are changes
Write-Host "Checking for changes..." -ForegroundColor Yellow
& $gitPath status --short

if ($LASTEXITCODE -eq 0) {
    $changes = & $gitPath status --short
    if ($changes) {
        Write-Host "Changes detected. Creating commit..." -ForegroundColor Yellow
        
        # Add all changes
        & $gitPath add .
        
        # Create commit with timestamp
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        & $gitPath commit -m "Daily auto-commit: $timestamp"
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "Commit created successfully!" -ForegroundColor Green
            Write-Host "Commit message: Daily auto-commit: $timestamp" -ForegroundColor Cyan
        } else {
            Write-Host "Failed to create commit." -ForegroundColor Red
        }
    } else {
        Write-Host "No changes detected. Nothing to commit." -ForegroundColor Green
    }
} else {
    Write-Host "Git status check failed." -ForegroundColor Red
}

Write-Host "Daily commit process completed." -ForegroundColor Green