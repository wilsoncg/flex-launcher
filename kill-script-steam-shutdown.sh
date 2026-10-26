#!/usr/bin/env bash

# Ask Steam to shut down cleanly
if pgrep -x steam >/dev/null || pgrep -f 'steamwebhelper' >/dev/null; then
    steam -shutdown && qdbus org.kde.plasmashell /org/kde/osdService org.kde.osdService.showText video-display "Steam closed"

    # Wait up to 15 seconds for the main Steam process to exit
    for ((i = 0; i < 15; i++)); do
        if ! pgrep -x steam >/dev/null; then
            break
        fi
        sleep 1
    done

    # Last resort: request termination, not an immediate kill
    if pgrep -x steam >/dev/null; then
        pkill -TERM -x steam && qdbus org.kde.plasmashell /org/kde/osdService org.kde.osdService.showText video-display "Steam termination requested"
    fi
fi
