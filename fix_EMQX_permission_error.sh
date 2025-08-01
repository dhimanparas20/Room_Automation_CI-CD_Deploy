#!/bin/bash

# Script to fix EMQX/Mosquitto Docker data directory permissions

# Set your project directory here
PROJECT_DIR=~/setup-mosquitto-with-docker
DATA_DIR="$PROJECT_DIR/data"

# 1. Ensure the data directory exists
mkdir -p "$DATA_DIR"

# 2. Set ownership to emqx user (UID 1000)
sudo chown -R 1000:1000 "$DATA_DIR"

# 3. Set permissions to 755
sudo chmod -R 755 "$DATA_DIR"

# 4. Bring down any running containers
cd "$PROJECT_DIR"
sudo docker compose down

# 5. Bring up the EMQX service
sudo docker compose up -d emqx

echo "✅ EMQX data directory permissions fixed and service started!"
