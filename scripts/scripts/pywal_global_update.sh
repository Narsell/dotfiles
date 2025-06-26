#!/usr/bin/env bash

# pywal_global_update.sh
#
# A script to apply a new pywal theme to all relevant applications.
# This script is intended to be called by another program (like waypaper)
# that provides the path to the new wallpaper as the first argument.

# --- Configuration ---
# Exit immediately if a command exits with a non-zero status.
# This is crucial for preventing a chain of failures.
set -e

# --- Argument Check ---
# Check if a wallpaper path was provided. If not, print an error and exit.
if [ -z "$1" ]; then
    echo "Error: No wallpaper path provided."
    echo "Usage: $0 /path/to/wallpaper.jpg"
    exit 1
fi

# Assign the first command-line argument to a variable with a clear name.
WALLPAPER_PATH="$1"

# --- Main Execution ---
echo "==> Starting Pywal global update..."

echo "Setting new theme from: $WALLPAPER_PATH"
wal -q -i "$WALLPAPER_PATH"

echo "Reloading Wayland notification daemon..."
swaync-client -rs

echo "Reloading Waybar for new theme..."
killall -SIGUSR2 waybar

echo "Updating Firefox theme..."
pywalfox update --verbose -p

echo "Merging Xresources for dmenu and other X apps..."
xrdb -merge ~/.Xresources

echo "==> Theme update complete!"
