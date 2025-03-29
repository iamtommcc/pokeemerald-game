#!/bin/bash

# Get absolute paths for the elf and gba files
ELF_FILE=$(realpath "$1")
GBA_FILE=$(realpath "$2")

# ANSI escape codes for colors
GREEN='\033[1;32m'
NC='\033[0m' # No Color

# Print the success message
echo ""
echo ""
echo -e "${GREEN}✅ BUILD SUCCEEDED${NC}"

echo -e "${NC}" # Reset color
echo "  • ELF file: $ELF_FILE"
echo "  • GBA file: $GBA_FILE"
echo "" 