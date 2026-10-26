#!/bin/sh

window=$(kdotool search --class '^es-de$' | head -n1)

if [ -n "$window" ]; then
    kdotool windowactivate "$window"
else
    gio launch /home/craig/.local/share/applications/es-de.desktop
fi
