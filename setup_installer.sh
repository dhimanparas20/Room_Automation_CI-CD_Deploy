#!/bin/bash

# Exit immediately if any command fails
set -e

# Clear the terminal screen
clear

#Remove Exiting directory
sudo rm -rf setup-mosquitto-with-docker

# Clone the main repository
git clone https://github.com/dhimanparas20/setup-mosquitto-with-docker.git

# Navigate to the cloned repository
cd setup-mosquitto-with-docker

# Clone the dependent repositories inside it
git clone https://github.com/dhimanparas20/room_automation_telegram_bot_main.git
git clone https://github.com/dhimanparas20/Room_Automation_Scheduler.git

# Create an empty .env file if it doesn't exist
touch .env

echo "Setup completed successfully!"

