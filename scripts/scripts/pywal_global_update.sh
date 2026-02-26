#!/usr/bin/env bash
# author: @narsell

# A script that runs pywal to generate colors from a wallpaper and reloads applications.
# If a wallpaper path is not provided, it will reload the current theme from the currently selected wallpaper.

set -e

WAL_CACHE_DIR="${HOME}/.cache/wal"

if [[ -z "$1" ]]; then
    echo "No wallpaper path provided, updating colors with current wallpaper..."
	wal --cols16=lighten -e -w

	LAST_USED_THEME=$(cat "${WAL_CACHE_DIR}/last_used_theme")
	if [[ -n "$LAST_USED_THEME" ]]; then
		echo "Updating Vesktop walcord with theme ${LAST_USED_THEME}..."
		walcord -j "${WAL_CACHE_DIR}/schemes/${LAST_USED_THEME}" -t ~/.config/vesktop/themes/midnight-vesktop.template.css -o ~/.config/vesktop/themes/midnight-vesktop.theme.css
	fi
else
	WALLPAPER_PATH="$1"
	echo "Setting new theme from: ${WALLPAPER_PATH}..."
	wal --cols16=lighten -e -i "$WALLPAPER_PATH"
	
	echo "Updating Vesktop walcord theme..."
	walcord -i $WALLPAPER_PATH -t ~/.config/vesktop/themes/midnight-vesktop.template.css -o ~/.config/vesktop/themes/midnight-vesktop.theme.css 
fi

echo "Reloading swaync notification control center..."
swaync-client -rs

echo "Reloading Waybar for new theme..."
killall -SIGUSR2 waybar

echo "Updating Firefox theme..."
pywalfox update --verbose -p

echo "Merging Xresources for dmenu and other X apps..."
xrdb -merge ~/.Xresources

echo "Reset GTK theme"
~/scripts/reset_gtk_theme.sh

echo "==> Theme update complete!"
