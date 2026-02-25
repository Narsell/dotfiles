#!/usr/bin/env bash

# A script that reloads the currently selected GTK theme.
# Stolen from https://askubuntu.com/questions/151513/reload-gtk-3-0-theme/1110354#1110354
 
DEFAULT_THEME="PywalTheme" 
CURRENT_THEME=$(gsettings get org.gnome.desktop.interface gtk-theme)
if [[ -z "$CURRENT_THEME" || "$CURRENT_THEME" == "''" ]]; then
	echo "No GTK theme is currently set, setting it to back to "$DEFAULT_THEME""
	CURRENT_THEME="$DEFAULT_THEME"
fi

gsettings set org.gnome.desktop.interface gtk-theme ''
echo "Reloading GTK Theme "$CURRENT_THEME"..."
sleep 1
gsettings set org.gnome.desktop.interface gtk-theme "$CURRENT_THEME"
echo "Done!"
