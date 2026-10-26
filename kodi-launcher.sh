#!/bin/bash

window=$(kdotool search --name 'kodi' | head -n1)

if [ -n "$window" ]; then
    kdotool windowactivate "$window"
else
    kodi &
fi
