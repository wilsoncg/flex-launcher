#!/bin/bash

window=$(kdotool search --class flex-launcher | head -n1)

if [ -n "$window" ]; then
    kdotool windowactivate "$window"
else
    /usr/share/flex-launcher/flex-launcher &
fi
