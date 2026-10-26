#!/bin/sh

kdotool search --name 'htpc-jellyfin' windowclose && qdbus org.kde.plasmashell /org/kde/osdService org.kde.osdService.showText video-display "Jellyfin webapp closed"

