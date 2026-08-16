#!/bin/bash

echo "Memory Usage:"
free -h | awk '/Mem:/ {
    printf "Used: %s / Total: %s\n", $3, $2
}'
