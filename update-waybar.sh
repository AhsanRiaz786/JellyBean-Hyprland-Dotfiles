#!/bin/bash
wal -i /path/to/your/wallpaper

# Extract colors manually
cat ~/.cache/wal/colors.css | grep -Eo '--color[0-7]: [#0-9a-fA-F]+' | while read -r line; do
    color_name=$(echo $line | cut -d':' -f1)
    color_value=$(echo $line | cut -d':' -f2 | xargs)
    sed -i "s/$color_name:.*/$color_name: $color_value;/g" ~/.config/waybar/style.css
done

pkill waybar
waybar &

