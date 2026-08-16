
#!/bin/bash

echo "================================="
echo "   LINUX SERVER HEALTH MONITOR"
echo "================================="

echo "Hostname:"
hostname

echo "System Uptime:"
uptime -p

echo ""
./scripts/cpu.sh

echo ""
./scripts/mem.sh

echo ""
./scripts/disk.sh

echo ""
./scripts/network.sh

echo "Top Processes:"
ps aux --sort=-%cpu | head -n 6

echo "================================="
#echo "        CHECK COMPLETE"
echo "================================="
###


#!/bin/bash

# ==========================================
# Linux Server Health Monitor
# ==========================================

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"

REPORT_DIR="$PROJECT_DIR/reports"
LOG_DIR="$PROJECT_DIR/logs"

REPORT_FILE="$REPORT_DIR/system-report.txt"
LOG_FILE="$LOG_DIR/system.log"

# Create folders if they don't exist
mkdir -p "$REPORT_DIR"
mkdir -p "$LOG_DIR"

DATE=$(date '+%Y-%m-%d %H:%M:%S')
HOSTNAME=$(hostname)
UPTIME=$(uptime -p)

# ==========================================
# CPU Usage
# ==========================================

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')

# ==========================================
# Memory Usage
# ==========================================

MEMORY=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')

# ==========================================
# Disk Usage
# ==========================================

DISK=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

# ==========================================
# Network Status
# ==========================================

if ping -c 1 -W 2 8.8.8.8 > /dev/null 2>&1
then
    NETWORK="ONLINE"
else
    NETWORK="OFFLINE"
fi

# ==========================================
# Health Status
# ==========================================

if (( $(echo "$CPU >= 80" | bc -l) )) || \
   [ "$MEMORY" -ge 80 ] || \
   [ "$DISK" -ge 80 ]; then

    HEALTH="CRITICAL"

elif (( $(echo "$CPU >= 60" | bc -l) )) || \
     [ "$MEMORY" -ge 60 ] || \
     [ "$DISK" -ge 60 ]; then

    HEALTH="WARNING"

else

    HEALTH="HEALTHY"

fi

# ==========================================
# Display Monitor
# ==========================================

echo "=========================================="
echo "       LINUX SERVER HEALTH MONITOR"
echo "=========================================="
echo ""
echo "Date          : $DATE"
echo "Hostname      : $HOSTNAME"
echo "System Uptime : $UPTIME"
echo "CPU Usage     : ${CPU}%"
echo "Memory Usage  : ${MEMORY}%"
echo "Disk Usage    : ${DISK}%"
echo "Network Status: $NETWORK"
echo "Health Status : $HEALTH"
echo ""

echo "Top Processes:"
echo "------------------------------------------"

ps aux --sort=-%cpu | head -n 6

echo ""
echo "=========================================="

# ==========================================
# Generate System Report
# ==========================================

cat > "$REPORT_FILE" << EOF
==========================================
       LINUX SERVER HEALTH REPORT
==========================================

Date          : $DATE
Hostname      : $HOSTNAME
System Uptime : $UPTIME

------------------------------------------
RESOURCE USAGE
------------------------------------------

CPU Usage     : ${CPU}%
Memory Usage  : ${MEMORY}%
Disk Usage    : ${DISK}%

------------------------------------------
NETWORK STATUS
------------------------------------------

Network       : $NETWORK

------------------------------------------
HEALTH STATUS
------------------------------------------

System Health : $HEALTH

------------------------------------------
TOP PROCESSES
------------------------------------------

$(ps aux --sort=-%cpu | head -n 6)

==========================================
EOF

# ==========================================
# Save Monitoring Log
# ==========================================

echo "[$DATE] CPU=${CPU}% RAM=${MEMORY}% DISK=${DISK}% NETWORK=${NETWORK} HEALTH=${HEALTH}" >> "$LOG_FILE"

echo ""
echo "Report saved to:"
echo "$REPORT_FILE"

echo ""
echo "Log saved to:"
echo "$LOG_FILE"
