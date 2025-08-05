# Room Automation Server Setup

This project automates the setup of a room automation server using Docker, EMQX/Mosquitto, and integrates dependent repositories for Telegram bot and scheduling.

## Features

- Automated setup of Mosquitto/EMQX MQTT broker.
- Integration with a Telegram bot for room automation control.
- Scheduling functionality for automated tasks.
- Easy deployment using Docker and Bash scripts.

## Repositories Used

- [setup-mosquitto-with-docker](https://github.com/dhimanparas20/setup-mosquitto-with-docker): Sets up the MQTT broker.
- [room_automation_telegram_bot_main](https://github.com/dhimanparas20/room_automation_telegram_bot_main): Telegram bot for user interaction.
- [Room_Automation_Scheduler](https://github.com/dhimanparas20/Room_Automation_Scheduler): Handles task scheduling.

## Prerequisites

- **Docker & Docker Compose**: Ensure Docker is installed and running.
- **Bash shell**: Required to execute the setup script.
- **Git**: Used to clone repositories.

## Setup Instructions

0. You can also run the setup directly with a single command:
    ```bash
    wget -O - https://raw.githubusercontent.com/dhimanparas20/Room_Automation_CI-CD_Deploy/refs/heads/main/setup_installer.sh | bash
    ```
- This will download and execute the setup script, which clones all required repositories and starts the services.

1. Clone this repository:
   ```bash
   git clone https://github.com/dhimanparas20/Room_Automation_MAIN_CI-CD_Deploy.git
   cd Room_Automation_MAIN_CI-CD_Deploy
   ```

2. Run the setup script:
   ```bash
   bash setup_installer.sh
   ```

3. The script will:
   - Clone all required repositories.
   - Set up Docker data directory permissions.
   - Start the EMQX service.

4. Verify the setup:
   - Check if the EMQX service is running:
     ```bash
     sudo docker ps
     ```
   - Ensure the `.env` file is created and populated with necessary variables.

## Environment Variables

- The `.env` file is created during setup. Add the following variables as needed:
  - `TELEGRAM_BOT_TOKEN`: Token for the Telegram bot.
  - `SCHEDULER_CONFIG`: Configuration for the scheduler.
  - `MQTT_BROKER_URL`: URL of the MQTT broker.

## Troubleshooting

- **Docker Issues**:
  - Ensure Docker is installed and running.
  - Run the script with `sudo` if permission errors occur.
- **Service Not Starting**:
  - Check Docker logs for errors:
    ```bash
    sudo docker logs <container_id>
    ```
- **Permission Errors**:
  - Ensure the `data` directory has correct ownership and permissions:
    ```bash
    sudo chown -R 1000:1000 data
    sudo chmod -R 755 data
    ```

## Project Structure

```
Room_Automation_MAIN_CI-CD_Deploy/
├── setup_installer.sh   # Main setup script
├── server/              # Cloned Mosquitto repository
├── data/                # Data directory for EMQX
└── .env                 # Environment variables file
```

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## Contact
For any questions or support, please contact [dhimanparas20](https://github.com/dhimanparas20).
