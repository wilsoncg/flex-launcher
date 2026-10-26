#!/bin/sh

kdotool search --class '^es-de$' windowclose && qdbus org.kde.plasmashell /org/kde/osdService org.kde.osdService.showText video-display "Emulation Station closed"
