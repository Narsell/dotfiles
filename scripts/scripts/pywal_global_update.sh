#!/usr/bin/env bash

# A script to apply a new pywal theme to all relevant applications.
# This script is intended to be called by another program (like waypaper)
# that provides the path to the new wallpaper as the first argument.

set -e

if [ -z "$1" ]; then
    echo "Error: No wallpaper path provided."
    echo "Usage: $0 /path/to/wallpaper.jpg"
    exit 1
fi

WALLPAPER_PATH="$1"

echo "==> Starting Pywal global update..."

echo "Setting new theme from: $WALLPAPER_PATH"
wal -q -i "$WALLPAPER_PATH"

echo "Reloading Wayland notification daemon..."
swaync-client -rs

echo "Reloading Waybar for new theme..."
killall -SIGUSR2 waybar

echo "Updating Firefox theme..."
pywalfox update --verbose -p

echo "Updating Vesktop walcord theme..."
walcord -i $WALLPAPER_PATH -t ~/.config/vesktop/themes/midnight-vesktop.template.css -o ~/.config/vesktop/themes/midnight-vesktop.theme.css 

echo "Merging Xresources for dmenu and other X apps..."
xrdb -merge ~/.Xresources

echo "Reset GTK theme"
~/scripts/reset_gtk_theme.sh

echo "==> Theme update complete!"
