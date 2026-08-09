# Python Learning Journey - Virtual Environment Setup
# This script creates a local virtual environment as a fallback option

Write-Host "Setting up Python Learning Virtual Environment..." -ForegroundColor Green

# Navigate to the project directory
Set-Location "C:\MyJScode"

# Check if Python is available
try {
    python --version > $null 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Python not found. Please install Python 3.13 or later." -ForegroundColor Red
        Start-Sleep -Seconds 5
        exit 1
    }
} catch {
    Write-Host "Python not found. Please install Python 3.13 or later." -ForegroundColor Red
    Start-Sleep -Seconds 5
    exit 1
}

# Create virtual environment
Write-Host "Creating virtual environment..." -ForegroundColor Yellow
python -m venv venv

if ($LASTEXITCODE -eq 0) {
    Write-Host "Virtual environment created successfully!" -ForegroundColor Green
    
    # Activate virtual environment
    Write-Host "Activating virtual environment..." -ForegroundColor Yellow
    & .\venv\Scripts\Activate.ps1
    
    # Install dependencies
    Write-Host "Installing dependencies from requirements.txt..." -ForegroundColor Yellow
    pip install -r requirements.txt
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Dependencies installed successfully!" -ForegroundColor Green
        Write-Host ""
        Write-Host "Virtual environment setup complete!" -ForegroundColor Green
        Write-Host "To activate it manually, run: .\venv\Scripts\Activate.ps1" -ForegroundColor Cyan
        Write-Host "To start Jupyter, run: jupyter lab" -ForegroundColor Cyan
        Write-Host "To deactivate, run: deactivate" -ForegroundColor Cyan
    } else {
        Write-Host "Failed to install dependencies." -ForegroundColor Red
        Start-Sleep -Seconds 5
    }
} else {
    Write-Host "Failed to create virtual environment." -ForegroundColor Red
    Start-Sleep -Seconds 5
}