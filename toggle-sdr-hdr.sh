#!/bin/bash

case "$1" in
    sdr)
        toggle="disable"
        message="SDR"
        ;;
    hdr)
        toggle="enable"
        message="HDR"
        ;;
    *)
        echo "Usage: $0 {sdr|hdr}"
        exit 1
        ;;
esac

kscreen-doctor output.HDMI-A-2.hdrAndWcg."$toggle" && sleep 2 && qdbus org.kde.plasmashell /org/kde/osdService org.kde.osdService.showText video-display "$message enabled"
