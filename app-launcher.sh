#!/bin/bash

case "$1" in
    youtube)
        app='org.smarttube.stable/com.liskovsoft.smartyoutubetv2.tv.ui.main.SplashActivity'
        ;;
    spotify)
        app='com.spotify.tv.android/.SpotifyTVActivity'
        ;;
    *)
        echo "Usage: $0 {youtube|spotify}"
        exit 1
        ;;
esac

window=$(kdotool search --name 'Waydroid$' | head -n1)

if [ -n "$window" ]; then
    adb shell am start -n "$app"
    kdotool windowactivate "$window"
else
     # Start the existing Waydroid session/UI
    waydroid show-full-ui &

    # Wait for Android/Waydroid to finish starting
    for i in {1..30}; do
        if waydroid status 2>/dev/null | grep -q 'Session:.*RUNNING'; then
            break
        fi
        sleep 1
    done

    # Connect host adb to Waydroid
    waydroid adb connect

    # Wait for ADB to become available
    for i in {1..30}; do
        if adb shell getprop sys.boot_completed 2>/dev/null | grep -q '^1$'; then
            break
        fi
        sleep 1
    done

    # Launch SmartTube directly through Android
    adb shell am start -n "$app"
fi
