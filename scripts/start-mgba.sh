#!/bin/bash

APP="/Applications/mGBA.app"
ELF="$1"

# Kill all mGBA instances
pkill -f mGBA

# Kill anything listening on port 2345
lsof -ti tcp:2345 | xargs -r kill -9

# Start mGBA with GDB
/usr/bin/open -n -a "$APP" --args --gdb "$ELF"

# Wait for mGBA GDB server to start
echo "Waiting for mGBA GDB server on port 2345..."
while ! lsof -i tcp:2345 > /dev/null; do
    sleep 1
done

echo "mGBA GDB server started."