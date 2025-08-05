#!/bin/bash

# Exit immediately if any command fails
set -e

# Clear the terminal screen
clear

# Create 'server' directory if it doesn't exist and navigate into it
mkdir -p server
cd server

# Clone all required repositories inside 'server'
git clone https://github.com/dhimanparas20/Room_Automation_CI-CD_Deploy.git
git clone https://github.com/dhimanparas20/Room_Automation_TELEGRAM_BOT.git
git clone https://github.com/dhimanparas20/Room_Automation_SCHEDULER.git
git clone https://github.com/dhimanparas20/lazydocker-web.git

# Navigate into the main repository (setup-mosquitto-with-docker)
cd Room_Automation_CI-CD_Deploy

# Create an empty .env file if it doesn't exist
touch .env

# --- Fix EMQX/Mosquitto Docker data directory permissions ---

PROJECT_DIR=$(pwd)
DATA_DIR="$PROJECT_DIR/data"

# Ensure the data directory exists
mkdir -p "$DATA_DIR"

# Set ownership to emqx user (UID 1000)
sudo chown -R 1000:1000 "$DATA_DIR"

# Set permissions to 755
sudo chmod -R 755 "$DATA_DIR"

# --- Fix EMQX/Mosquitto Docker log directory permissions ---

LOG_DIR="$PROJECT_DIR/log"

# Ensure the log directory exists
mkdir -p "$LOG_DIR"

# Set ownership to emqx user (UID 1000)
sudo chown -R 1000:1000 "$LOG_DIR"

# Set permissions to 755
sudo chmod -R 755 "$LOG_DIR"

echo "✅ Setup completed successfully!"
