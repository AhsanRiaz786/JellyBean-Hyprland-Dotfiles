
#!/bin/bash

# Check if Spotify is running using playerctl
player=$(playerctl -p spotify status 2>/dev/null)

# Fetch the current playing song and artist using playerctl
if [ "$player" = "Playing" ] || [ "$player" = "Paused" ]; then
    artist=$(playerctl -p spotify metadata artist)
    title=$(playerctl -p spotify metadata title)

    # Quote variables to handle special characters
    artist=$(printf "%s" "$artist")
    title=$(printf "%s" "$title")

    # Check if the current playing track is an advertisement
    if [ "$title" = "Advertisement" ]; then
        echo ""
    else
        echo "  $title - $artist"
    fi
else
    echo ""
fi

