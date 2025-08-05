#!/bin/bash

# Exit immediately if any command fails
set -e

echo "---------------------------------------------------------"
echo "Clearing the terminal screen..."
clear

echo "---------------------------------------------------------"
echo "Creating 'server' directory if it doesn't exist and navigating into it..."
mkdir -p server
cd server

echo "---------------------------------------------------------"
echo "Cloning all required repositories inside 'server'..."
git clone https://github.com/dhimanparas20/Room_Automation_CI-CD_Deploy.git
git clone https://github.com/dhimanparas20/Room_Automation_TELEGRAM_BOT.git
git clone https://github.com/dhimanparas20/Room_Automation_SCHEDULER.git
git clone https://github.com/dhimanparas20/lazydocker-web.git

echo "---------------------------------------------------------"
echo "Navigating into the main repository (Room_Automation_CI-CD_Deploy)..."
cd Room_Automation_CI-CD_Deploy

echo "---------------------------------------------------------"
echo "Renaming .env_sample to .env..."
mv .env_sample .env

echo "---------------------------------------------------------"
echo "Setting up EMQX/Mosquitto Docker data directory permissions..."
PROJECT_DIR=$(pwd)
DATA_DIR="$PROJECT_DIR/data"
mkdir -p "$DATA_DIR"
sudo chown -R 1000:1000 "$DATA_DIR"
sudo chmod -R 755 "$DATA_DIR"

echo "---------------------------------------------------------"
echo "Setting up EMQX/Mosquitto Docker log directory permissions..."
LOG_DIR="$PROJECT_DIR/log"
mkdir -p "$LOG_DIR"
sudo chown -R 1000:1000 "$LOG_DIR"
sudo chmod -R 755 "$LOG_DIR"

echo "---------------------------------------------------------"
echo "Bringing down any running Docker Compose containers..."
sudo docker compose down

echo "---------------------------------------------------------"
echo "Building  Docker Compose services..."
sudo docker compose up --build

echo "---------------------------------------------------------"
echo "Pruning unused Docker networks, images, and volumes..."
sudo docker system prune -af --volumes

echo "✅ Setup completed successfully!"

echo "---------------------------------------------------------"
echo "Script will exit in 2 seconds..."
sleep 2
exit 0
