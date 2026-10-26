#!/bin/bash

TIMEOUT=5

echo "Stopping Waydroid gracefully..."
waydroid session stop

for ((i=0; i<TIMEOUT; i++)); do
    if ! waydroid status 2>/dev/null | grep -q "Session.*RUNNING"; then
        echo "Waydroid stopped cleanly."
        exit 0
    fi
    sleep 1
done

echo "Waydroid did not stop cleanly, terminating processes..."

# Give the Waydroid processes a chance to exit
pkill -TERM -f 'waydroid' 2>/dev/null

sleep 2

# Anything still alive gets killed
if pgrep -f 'waydroid' >/dev/null; then
    echo "Waydroid still running, forcing termination..."
    pkill -KILL -f 'waydroid' 2>/dev/null
fi

qdbus org.kde.plasmashell /org/kde/osdService org.kde.osdService.showText video-display "Waydroid closed"
