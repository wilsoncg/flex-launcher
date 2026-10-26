#!/bin/bash

# Shut down Steam if active; abort if shutdown fails
if pidof steam >/dev/null; then
    if ! kill-script-steam-shutdown.sh; then
        qdbus org.kde.plasmashell /org/kde/osdService org.kde.osdService.showText video-display "Failed steam shutdown"
        exit 1
    fi
fi

window=$(kdotool search --name 'Waydroid$' | head -n1)

if [ -n "$window" ]; then
    kdotool windowactivate "$window"
else
    waydroid show-full-ui &
fi
