#!/bin/bash

# Git repository updater script. By Ikipm. 

repo_dir="/path/to/your/repo"
restart=false
app_service="your-app.service"

# Change to the repository directory
cd $repo_dir

# Pull the latest changes from the remote repository
if ! git pull; then
    echo -e "[\e[32mikipm_utilities\e[0m] \e[31mError\e[0m: Failed to pull the latest changes from the remote repository"
    sleep 30
    exit 1
fi

# Restart the application
if [ $restart = true ]; then
    sudo systemctl restart $app_service
fi

# Exit the script
exit 0

# chmod +x /path/to/your/repo/repo_updater.sh
# crontab -e and add: 0 * * * * /path/to/your/repo/repo_updater.sh (this will run the script every hour)