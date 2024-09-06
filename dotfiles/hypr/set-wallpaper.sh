#!/bin/bash

# Directory containing your wallpapers
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

# Select a random wallpaper from the directory
WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Set the wallpaper using swaybg
swaybg -i "$WALLPAPER" -m fill &

# Generate the pywal colorscheme from the wallpaper
wal -i "$WALLPAPER"

# Apply the colorscheme
# Ensure pywal is set to apply colors to your terminal and other applications
source $HOME/.cache/wal/colors.sh

