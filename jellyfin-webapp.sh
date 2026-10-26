#!/bin/sh

window=$(kdotool search --name 'htpc-jellyfin' | head -n1)

if [ -n "$window" ]; then
    kdotool windowactivate "$window"
    kdotool windowstate --add FULLSCREEN "$window"
else
    gio launch /home/craig/.local/share/applications/WebApp-Jellyfin-flex.desktop &

    for i in $(seq 1 20); do
        sleep 0.1
        window=$(kdotool search --name 'htpc-jellyfin' | head -n1)

        if [ -n "$window" ]; then
            kdotool windowactivate "$window"
            kdotool windowstate --add FULLSCREEN "$window"
            break
        fi
    done
fi
