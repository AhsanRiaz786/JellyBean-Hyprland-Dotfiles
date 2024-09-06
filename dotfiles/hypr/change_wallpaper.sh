#!/bin/bash
# Directory containing your wallpapers
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

# Select a random wallpaper from the directory
WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Set the wallpaper using swaybg
swaybg -i "$WALLPAPER" -m fill &

# Wait for a short time to ensure the wallpaper is fully applied


# Generate the pywal colorscheme from the wallpaper
wal -i "$WALLPAPER"
# Convert hex colors to ARGB format
hex_to_argb() {
    hex="$1"
    r="${hex:1:2}"
    g="${hex:3:2}"
    b="${hex:5:2}"
    a="ee"  # Alpha value in hex (can be customized)
    echo "0x$a$r$g$b"
}

# Update Hyprland colors in the config file located in ~/.cache/wal/hypr.conf
HYPR_CONF="$HOME/.cache/wal/hypr.conf"
{
    echo "# Hyprland colorscheme generated by pywal"
    echo "\$border_color = $(hex_to_argb $(sed -n '1p' ~/.cache/wal/colors))"
    echo "\$active_border_color = $(hex_to_argb $(sed -n '2p' ~/.cache/wal/colors))"
    echo "\$inactive_border_color = $(hex_to_argb $(sed -n '3p' ~/.cache/wal/colors))"
} > "$HYPR_CONF"

pywalfox update

# Reload Hyprland to apply the new colors
#hyprctl reload

