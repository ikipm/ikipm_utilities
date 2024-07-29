# Git repository updater script. By Ikipm. 

$repo_dir = "C:\path\to\your\repo"
$restart = $false
$app_service = "your-app.service"

# Change to the repository directory
Set-Location -Path $repo_dir

# Pull the latest changes from the remote repository
try {
    git pull
}
catch {
    Write-Host "[ikipm_utilities] Error: Failed to pull the latest changes from the remote repository" -ForegroundColor Red
    Start-Sleep -Seconds 30
    exit 1
}

# Restart the application
if ($restart -eq $true) {
    Restart-Service -Name $app_service
}

# Exit the script
exit 0

# schtasks /create /tn "[ikipm_utilities] Github repository updater" /tr "powershell.exe -File C:\path\to\your\script.ps1" /sc HOURLY
