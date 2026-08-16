#!/bin/bash

DISK_USAGE=$(df / | awk 'NR==2 {print $5}')

echo "Disk Usage: $DISK_USAGE"
