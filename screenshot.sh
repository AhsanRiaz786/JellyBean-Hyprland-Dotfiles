#!/bin/bash

SCREENSHOT_DIR="$HOME/Pictures"
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
FILENAME="$SCREENSHOT_DIR/screenshot-$TIMESTAMP.png"

    # Full-screen screenshot
grim "$FILENAME"

# Notify user (optional, if you have `notify-send` installed)
notify-send "Screenshot taken" "$FILENAME"

