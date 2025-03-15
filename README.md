# Room Automation Server Setup

Room Automation Server Setup is a complete deployment solution for room automation projects. It includes four Docker containers:

1. **MQTT Server** - Manages message brokering for IoT devices.
2. **Telegram Bot** - Allows users to trigger MQTT-based devices via Telegram.
3. **Scheduler Website** - Enables scheduling device on/off actions based on time and date.
4. **Caddy Server** - Acts as a reverse proxy for handling secure web traffic.

Everything is managed via a single `docker-compose.yml` file.

---

## **Installation & Setup**

Follow these steps to install and deploy the project.

### **1. Download the Setup Installer Script**
```sh
wget https://raw.githubusercontent.com/dhimanparas20/setup-mosquitto-with-docker/refs/heads/main/setup_installer.sh
```
### **2. Grant Execute Permission to the Script**
```sh
chmod +x setup_installer.sh
```

### **3. Run the Installer**
```sh
./setup_installer.sh
```

### **4. Navigate to the Project Directory**
```sh
cd setup-mosquitto-with-docker
```

### **5. Edit the Environment Variables**
Modify the `.env` file using `nano`:
```sh
nano .env
```

#### **Example `.env` File Configuration**

```
# Caddy
WEB_DOMAIN=mstservices.tech

# Telegram Bot
BOT_TOKEN=
API_ID=  
API_HASH=

# MongoDB
MONGO_CONNECTION_STRING=
DB_NAME=

# MQTT Configuration
WEBSOCK_BROKER_ADDRESS=
WEBSOCK_PORT=
WEBSOCK_USE_SSL=True
VALID_TOKEN=
USE_CREDS=True
MQTT_USER=
MQTT_PASS=
QOS=0
CLEAN_SESSION=True
RETAINED=True
PINS=D1,D2,D3,D4,D5

# Flask Server
DEBUG=True
HOST=0.0.0.0
```

Fill in the required values before proceeding.

### **6. Create Docker Containers**
```sh
sudo docker compose create
```

### **7. Start MQTT and Configure Credentials**
Start the `mqtt5` container:
```sh
sudo docker start mqtt5
```

Then, access the container's shell:
```sh
sudo docker exec -it mqtt5 sh
```

Once inside the container, run:
```sh
mosquitto_passwd -c /mosquitto/config/pwfile <username>
```

You will be prompted to enter and confirm the password. Once done, type:
```sh
exit
```

### **8. Restart All Containers**
```sh
sudo docker compose restart
```

---

## **Project Components**

| Component      | Description |
|---------------|------------|
| **MQTT Server** | Handles MQTT message brokering for IoT devices. |
| **Telegram Bot** | Allows users to control devices via Telegram commands. |
| **Scheduler Website** | Provides a UI for scheduling device on/off actions. |
| **Caddy Server** | Reverse proxies the website and APIs, providing SSL and secure access. |

---

## **Usage**

- The **Telegram Bot** will allow you to control IoT devices by sending commands.  
- The **Scheduler Website** provides an interface to set up device schedules.  
- **MQTT Server** handles communication between the devices and the services.  
- **Caddy** ensures secure connections to the services.

---

## **Managing Containers**

- **Restart all containers**  
  ```sh
  docker-compose restart
  ```
- **Stop and Start containers**  
  ```sh
  docker-compose down && docker-compose up -d
  ```
- **Check running containers**  
  ```sh
  docker ps -a
  ```
- **View logs**  
  ```sh
  docker-compose logs -f
  ```

---

## **CI/CD with GitHub Workflows**

This project supports automated deployments using GitHub Actions. The workflow is designed to automate building, testing, and deploying the application.

### **Required Environment Variables**
To enable CI/CD, configure the following environment variables in your GitHub repository settings under **Secrets and Variables**:

- `SSH_PRIVATE_KEY` - The private SSH key for connecting to the deployment server.
- `SSH_HOST` - The host address of the deployment server.

- `MAIN_BRANCH` - The main branch for triggering CI/CD workflows.
  ```sh
  main
  ```
  
- `SCHEDULER_FOLDER` - The folder where the Scheduler Website is deployed.
  ```sh
  Room_Automation_Scheduler
  ```
  
- `TG_BOT_FOLDER` - The folder where the Telegram Bot is deployed.
  ```sh
  room_automation_telegram_bot_main
  ```
  
- `WORK_DIR` - The working directory on the server.
  ```sh
  setup-mosquitto-with-docker
  ```
  
- `SSH_USER` - The SSH user for executing deployment commands.
  ```sh
  ubuntu
  ```


This workflow will trigger automatically when changes are pushed to the `MAIN_BRANCH`. Ensure the required secrets are set up in your GitHub repository.

---

## **License**
This project is licensed under the MIT License.
