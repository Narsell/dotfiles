#!/usr/bin/env bash

# A script that reloads the currently selected GTK theme.
# Stolen from https://askubuntu.com/questions/151513/reload-gtk-3-0-theme/1110354#1110354
  
theme=$(gsettings get org.gnome.desktop.interface gtk-theme)
gsettings set org.gnome.desktop.interface gtk-theme ''
echo "Reloading GTK Theme: $theme"
sleep 1
gsettings set org.gnome.desktop.interface gtk-theme $theme
echo "Done!"
