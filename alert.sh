#!/bin/bash

# Load configuration
source "./config/config.sh"

# CPU usage
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')

# Memory usage
MEMORY=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')

# Disk usage
DISK=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

echo "======================================"
echo "       SYSTEM ALERT CHECK"
echo "======================================"

# CPU check
if (( $(echo "$CPU >= $CPU_THRESHOLD" | bc -l) )); then
    echo "⚠️ CPU ALERT: ${CPU}%"
else
    echo "✅ CPU usage is NORMAL: ${CPU}%"
fi

# Memory check
if [ "$MEMORY" -ge "$MEMORY_THRESHOLD" ]; then
    echo "⚠️ MEMORY ALERT: ${MEMORY}%"
else
    echo "✅ Memory usage is NORMAL: ${MEMORY}%"
fi

# Disk check
if [ "$DISK" -ge "$DISK_THRESHOLD" ]; then
    echo "⚠️ DISK ALERT: ${DISK}%"
else
    echo "✅ Disk usage is NORMAL: ${DISK}%"
fi

echo "======================================"
