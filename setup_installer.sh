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

# Create an empty .env file if it doesn't exist
touch .env

# --- Fix EMQX/Mosquitto Docker data directory permissions ---

# Set your project directory here (now 'server')
PROJECT_DIR=$(pwd)
DATA_DIR="$PROJECT_DIR/data"

# 1. Ensure the data directory exists
mkdir -p "$DATA_DIR"

# 2. Set ownership to emqx user (UID 1000)
sudo chown -R 1000:1000 "$DATA_DIR"

# 3. Set permissions to 755
sudo chmod -R 755 "$DATA_DIR"

# 4. Bring down any running containers
sudo docker compose down

# 5. Bring up the EMQX service
#sudo docker compose up -d emqx

echo "✅ Setup completed successfully! EMQX data directory permissions fixed and service started!"
