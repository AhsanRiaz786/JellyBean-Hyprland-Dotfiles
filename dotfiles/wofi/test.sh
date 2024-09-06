#!/bin/bash

# Path to pywal color file
wal_colors="$HOME/.cache/wal/colors"

# Path to wofi style.css
wofi_css="$HOME/.config/wofi/style.css"

# Replace placeholders in style.css with pywal colors
sed -i "s/@border/$(sed -n '7p' $wal_colors)/g" $wofi_css
sed -i "s/@background/$(head -n 1 $wal_colors)/g" $wofi_css
sed -i "s/@foreground/$(sed -n '2p' $wal_colors)/g" $wofi_css
sed -i "s/@input_bg/$(sed -n '3p' $wal_colors)/g" $wofi_css
sed -i "s/@selected_bg/$(sed -n '4p' $wal_colors)/g" $wofi_css

