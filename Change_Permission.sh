#!/bin/bash

# File or directory to change permissions
TARGET="/path/to/your/file_or_directory"

# Change permission to 777
chmod -R 777 "$TARGET"

# Optional: Log the action
echo "[$(date)] Changed permission of $TARGET to 777" >> /var/log/permission_change.log