#!/bin/bash

case "$1" in
    analog)
        sink="alsa_output.pci-0000_05_00.6.analog-stereo"
        ;;
    hdmi)
        sink="alsa_output.pci-0000_05_00.1.hdmi-stereo-extra2"
        ;;
    q45)
        sink="bluez_output.7C_E9_13_61_50_3F.1"
        ;;
    *)
        echo "Usage: $0 {analog|hdmi|q45}"
        exit 1
        ;;
esac

pactl set-default-sink "$sink" &&
pactl list short sink-inputs |
    awk '{print $1}' |
    while read -r id; do
        pactl move-sink-input "$id" "$sink"
    done
