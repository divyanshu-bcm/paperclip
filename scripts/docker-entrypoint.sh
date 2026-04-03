#!/bin/sh
set -e

# Capture runtime UID/GID from environment variables, defaulting to 1000
PUID=${USER_UID:-1000}
PGID=${USER_GID:-1000}

# Adjust the node user's UID/GID if they differ from the runtime request
if [ "$(id -u node)" -ne "$PUID" ]; then
    echo "Updating node UID to $PUID"
    usermod -o -u "$PUID" node
fi

if [ "$(id -g node)" -ne "$PGID" ]; then
    echo "Updating node GID to $PGID"
    groupmod -o -g "$PGID" node
    usermod -g "$PGID" node
fi

# Always ensure /paperclip is owned by node (Railway volumes mount as root)
mkdir -p /paperclip/instances/default/logs \
         /paperclip/instances/default/secrets \
         /paperclip/instances/default/data/storage \
         /paperclip/instances/default/data/backups \
         /paperclip/instances/default/workspaces
chown -R node:node /paperclip

exec gosu node "$@"
