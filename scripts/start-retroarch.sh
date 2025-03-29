#!/bin/bash

RETROARCH_APP="/Applications/RetroArch.app/Contents/MacOS/RetroArch"
CORE_PATH="$HOME/Library/Application Support/RetroArch/cores/mgba_libretro.dylib"
ROM_PATH="$1"

# Basic checks
if [ -z "$ROM_PATH" ]; then
  echo "Usage: $0 <path_to_rom.gba>"
  exit 1
fi

if [ ! -f "$ROM_PATH" ]; then
  echo "Error: ROM file not found at $ROM_PATH"
  exit 1
fi

if [ ! -f "$RETROARCH_APP" ]; then
    echo "Error: RetroArch executable not found at $RETROARCH_APP"
    exit 1
fi

if [ ! -f "$CORE_PATH" ]; then
    echo "Error: mGBA libretro core not found at $CORE_PATH"
    exit 1
fi

# ANSI escape codes for colors
GREEN='\033[1;32m'
NC='\033[0m' # No Color

# Print the success message
echo ""
echo -e "${GREEN}✅ EMULATOR STARTED${NC}"
echo -e "${NC}" # Reset color

# Launch RetroArch
"$RETROARCH_APP" -L "$CORE_PATH" "$ROM_PATH" > /dev/null 2>&1 
