# Room Automation Server Setup

This project automates the setup of a room automation server using Docker, EMQX/Mosquitto, and integrates dependent repositories for Telegram bot and scheduling.

## Features

- Automated setup of Mosquitto/EMQX MQTT broker.
- Integration with a Telegram bot for room automation control.
- Scheduling functionality for automated tasks.
- Easy deployment using Docker and Bash scripts.

## Prerequisites

- **Docker & Docker Compose**: Ensure Docker is installed and running.
- **Bash shell**: Required to execute the setup script.
- **Git**: Used to clone repositories.

## Setup Instructions

You can run the setup directly with a single command:
```bash
wget -O - https://raw.githubusercontent.com/dhimanparas20/Room_Automation_CI-CD_Deploy/refs/heads/main/setup_installer.sh | bash
```
After running the above script, the code will deploy and run automatically. All is set—no further manual steps are required.

---

## GitHub CI/CD Environment Variables

For CI/CD pipeline configuration, set the following environment variables in your GitHub repository:

| Variable           | Description                        | Default/Example Value                |
|--------------------|------------------------------------|--------------------------------------|
| `MAIN_BRANCH`      | Main branch name                   | `main` (default)                     |
| `SSH_HOST`         | Server IP address                  | *(your server IP)*                   |
| `SSH_USER`         | SSH username                       | `ubuntu` (default)                   |
| `SSH_PRIVATE_KEY`  | SSH private key                    | *(your private key)*                 |
| `CI_CD_FOLDER`     | CI/CD deployment folder            | `Room_Automation_CI-CD_Deploy`       |
| `LAZYDOCKER_FOLDER`| Lazydocker web folder              | `lazydocker-web`                     |
| `SCHEDULER_FOLDER` | Scheduler folder                   | `Room_Automation_SCHEDULER`          |
| `TG_BOT_FOLDER`    | Telegram bot folder                | `Room_Automation_TELEGRAM_BOT`       |
| `WORK_DIR`         | Working directory on server        | `server` (default)                   |

**That’s it—nothing else is needed.**

---

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## Contact
For any questions or support, please contact [dhimanparas20](https://github.com/dhimanparas20).

---

Let me know if you want this as a file or need further tweaks!