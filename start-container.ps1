# Python Learning Journey - Docker Container Starter
# This script starts the Python development container

Write-Host "Starting Python Learning Journey Container..." -ForegroundColor Green

# Navigate to the project directory
Set-Location "C:\MyJScode"

# Check if Docker is running
try {
    & docker ps > $null 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Docker is not running. Please start Docker Desktop first." -ForegroundColor Red
        Write-Host "Or use virtual environment fallback: .\setup-venv.ps1" -ForegroundColor Yellow
        Start-Sleep -Seconds 5
        exit 1
    }
} catch {
    Write-Host "Docker is not running. Please start Docker Desktop first." -ForegroundColor Red
    Write-Host "Or use virtual environment fallback: .\setup-venv.ps1" -ForegroundColor Yellow
    Start-Sleep -Seconds 5
    exit 1
}

# Check if .env file exists
if (-not (Test-Path ".env")) {
    Write-Host "Creating .env file from template..." -ForegroundColor Yellow
    Copy-Item ".env.example" ".env"
    Write-Host "You can customize .env if needed." -ForegroundColor Yellow
}

# Start the container
Write-Host "Building and starting container..." -ForegroundColor Yellow
& docker-compose up -d --build

if ($LASTEXITCODE -eq 0) {
    Write-Host "Container started successfully!" -ForegroundColor Green
    Write-Host "Jupyter Lab is available at: http://localhost:8888" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Opening Jupyter Lab in your default browser..." -ForegroundColor Yellow
    Start-Process "http://localhost:8888"
    Write-Host "To stop the container, run: docker-compose down in C:\MyJScode" -ForegroundColor Yellow
    Write-Host "If Docker fails, use virtual environment: .\setup-venv.ps1" -ForegroundColor Yellow
} else {
    Write-Host "Failed to start container. Check the error messages above." -ForegroundColor Red
    Write-Host "Fallback option: Use virtual environment with .\setup-venv.ps1" -ForegroundColor Yellow
    Start-Sleep -Seconds 5
}