#!/bin/bash

# Check if NetworkManager is running
if ! systemctl is-active --quiet NetworkManager; then
    echo "NetworkManager is not running. Starting it now..."
    sudo systemctl start NetworkManager
fi

# Launch the GUI for NetworkManager
nm-connection-editor &

