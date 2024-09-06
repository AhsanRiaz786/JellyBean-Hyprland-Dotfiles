#!/bin/bash

# Mount External Hard Drive
echo "Mounting External Hard Drive..."
mount /dev/sdb5 /home/JellyBean/Drive-A
mount /dev/sdb6 /home/JellyBean/Drive-B
mount /dev/sdb3 /home/JellyBean/Drive-C
mount /dev/sdb7 /home/JellyBean/Drive-D

# Mount Google Drive
echo "Mounting Google Drive..."
rclone mount 'Google Drive': ~/Google-Drive --vfs-cache-mode writes &

# Mount OneDrive
echo "Mounting OneDrive..."
rclone mount 'One Drive': ~/One-Drive --vfs-cache-mode writes &

echo "All drives mounted successfully!"
   
