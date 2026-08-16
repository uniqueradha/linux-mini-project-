# 🐧 Linux Server Health Monitor & Automated Alert System

## 📌 Project Overview

Linux Server Health Monitor is a Bash-based Linux system monitoring project designed to check the health and performance of a Linux server.

The system monitors CPU usage, memory usage, disk usage, network connectivity, system uptime, and running processes. It also provides resource alerts, health status, system reports, and log files.

---

## 🎯 Project Objectives

* Monitor Linux server resources
* Check CPU utilization
* Check memory utilization
* Monitor disk usage
* Check network connectivity
* Display system uptime
* Monitor top running processes
* Generate resource alerts
* Determine overall system health
* Generate system reports
* Store monitoring logs
* Automate monitoring using Cron

---

## 🛠️ Technologies Used

* Linux
* Bash Shell Scripting
* Linux Commands
* Cron
* Git
* GitHub

---

## ⭐ Features

### 1. Hostname

Displays the hostname of the Linux system.

### 2. System Uptime

Displays how long the Linux system has been running.

### 3. CPU Monitoring

Checks the current CPU utilization.

### 4. Memory Monitoring

Checks the current RAM utilization.

### 5. Disk Monitoring

Checks disk space utilization.

### 6. Network Monitoring

Checks whether the Linux system has network connectivity.

### 7. Process Monitoring

Displays the top CPU-consuming processes.

### 8. Resource Alerts

Generates alerts when CPU, memory, or disk usage reaches the configured threshold.

### 9. Health Status

Classifies the system as:

* HEALTHY
* WARNING
* CRITICAL

### 10. System Report

Generates a detailed system health report.

### 11. Log File

Stores monitoring results with timestamps.

### 12. Automatic Monitoring

The project can be scheduled using Linux Cron.

---

## 📂 Project Structure

```text
linux-sever/
│
├── README.md
├── monitor.sh
├── alert.sh
│
├── config/
│   └── config.sh
│
├── scripts/
│   ├── cpu.sh
│   ├── memory.sh
│   ├── disk.sh
│   ├── network.sh
│   ├── processes.sh
│   └── health.sh
│
├── reports/
│   └── system-report.txt
│
└── logs/
    └── system.log
```

---

## ⚙️ Configuration

Resource thresholds are stored in:

```text
config/config.sh
```

Example:

```bash
CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=80
```

These values can be changed according to the server requirements.

---

## 🚀 Installation

Clone the project:

```bash
git clone https://github.com/YOUR_USERNAME/linux-sever.git
```

Enter the project directory:

```bash
cd linux-sever
```

Give execution permission:

```bash
chmod +x monitor.sh
chmod +x alert.sh
chmod +x scripts/*.sh
```

Install `bc`:

```bash
sudo apt update
sudo apt install bc -y
```

---

## ▶️ Usage

### Run the complete monitoring system

```bash
./monitor.sh
```

### Run the resource alert system

```bash
./alert.sh
```

### Run individual monitoring scripts

CPU:

```bash
./scripts/cpu.sh
```

Memory:

```bash
./scripts/memory.sh
```

Disk:

```bash
./scripts/disk.sh
```

Network:

```bash
./scripts/network.sh
```

Processes:

```bash
./scripts/processes.sh
```

Health:

```bash
./scripts/health.sh
```

---

## 📊 Example Output

```text
==========================================
       LINUX SERVER HEALTH MONITOR
==========================================

Hostname      : RADHAKRISHNAN
System Uptime : up 3 hours
CPU Usage     : 10.9%
Memory Usage  : 78%
Disk Usage    : 80%
Network Status: ONLINE
Health Status : CRITICAL

Top Processes:
------------------------------------------
USER       PID    %CPU    %MEM
user       123    5.2     1.4
user       456    3.8     2.1

==========================================
```

---

## 📄 System Report

The monitoring system generates:

```text
reports/system-report.txt
```

View the report:

```bash
cat reports/system-report.txt
```

---

## 📝 Log File

Monitoring results are stored in:

```text
logs/system.log
```

View logs:

```bash
cat logs/system.log
```

---

## ⏰ Automatic Monitoring with Cron

The monitoring script can be scheduled to run automatically.

Open Cron:

```bash
crontab -e
```

Add:

```bash
*/5 * * * * /home/YOUR_USERNAME/linux-sever/monitor.sh
```

This runs the monitoring system every 5 minutes.

Check the Cron configuration:

```bash
crontab -l
```

---

## 🔮 Future Improvements

* Email notifications
* Telegram alerts
* Web-based dashboard
* CPU/RAM/Disk graphs
* Docker deployment
* Python Flask dashboard
* Historical performance data
* Database storage
* Cloud server monitoring
* Prometheus integration
* Grafana dashboard

---

## 🎓 Learning Outcomes

Through this project, the following skills are demonstrated:

* Linux system administration
* Bash scripting
* Linux command-line tools
* Process monitoring
* Resource monitoring
* File and directory management
* Log management
* Cron job automation
* Error handling
* Git and GitHub

---

## 👨‍💻 Author

**Radha Krishnan**

GitHub: https://github.com/uniqueradha

---

## 📜 License

This project is created for educational and portfolio purposes.

