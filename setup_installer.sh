#!/bin/bash

# Exit immediately if any command fails
set -e

# Clear the terminal screen
clear

# Clone the main repository into 'server'
git clone https://github.com/dhimanparas20/setup-mosquitto-with-docker.git server

# Navigate to the cloned repository
cd server

# Clone the dependent repositories inside it
git clone https://github.com/dhimanparas20/room_automation_telegram_bot_main.git
git clone https://github.com/dhimanparas20/Room_Automation_Scheduler.git
git clone https://github.com/dhimanparas20/lazydocker-web.git

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

# Bring down any running containers
sudo docker compose down

# Bring up the EMQX service (uncomment if you want to start it automatically)
# sudo docker compose up -d emqx

echo "✅ Setup completed successfully! EMQX data and log directory permissions fixed!"
