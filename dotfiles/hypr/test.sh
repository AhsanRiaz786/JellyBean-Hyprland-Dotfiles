#!/bin/bash

# Directory containing your wallpapers
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

# Select a random wallpaper from the directory
WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Set the wallpaper using swaybg
swaybg -i "$WALLPAPER" -m fill &

# Wait for a short time to ensure the wallpaper is fully applied
sleep 1

# Generate the pywal colorscheme from the wallpaper
wal -i "$WALLPAPER"

# Function to convert hex color to 0xRRGGBBAA format
convert_color() {
    hex_color=$(echo "$1" | sed 's/#//')  # Remove the # from the hex color
    echo "0x${hex_color}ff"  # Append 'ff' for full opacity
}

# Extract and convert colors from the generated scheme
ACTIVE_BORDER_COLOR=$(convert_color $(sed -n '1p' ~/.cache/wal/colors))    # First color for active border
INACTIVE_BORDER_COLOR=$(convert_color $(sed -n '2p' ~/.cache/wal/colors))  # Second color for inactive border

# Debugging output
echo "Active Border Color: $ACTIVE_BORDER_COLOR"
echo "Inactive Border Color: $INACTIVE_BORDER_COLOR"

# Path to the Hyprland configuration file
HYPRLAND_CONF="$HOME/.config/hypr/hyprland.conf"

# Directly edit the configuration file
{
    grep -v '^col.active_border =' "$HYPRLAND_CONF"
    echo "col.active_border = $ACTIVE_BORDER_COLOR $ACTIVE_BORDER_COLOR 45deg"
    grep -v '^col.inactive_border =' "$HYPRLAND_CONF"
    echo "col.inactive_border = $INACTIVE_BORDER_COLOR"
} > "$HYPRLAND_CONF.new"

# Replace the old configuration file with the new one
mv "$HYPRLAND_CONF.new" "$HYPRLAND_CONF"

# Debugging output to verify if the .conf file is being updated
echo "Updated hyprland.conf:"
grep 'col.active_border\|col.inactive_border' "$HYPRLAND_CONF"

# Reload Hyprland to apply the new configuration
hyprctl reload

# Optionally restart your session or system to ensure the changes are applied
# For a session restart:
# pkill hyprland

# Refresh the terminal to apply the new colors (depends on your terminal)
source ~/.bashrc  # For bash
# source ~/.zshrc  # For zsh
# kill -SIGUSR1 $(pidof st)  # For st (simple terminal)
# xrdb ~/.Xresources  # For terminals using .Xresources

