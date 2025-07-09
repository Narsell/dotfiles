#!/bin/bash
# Sets up the rofi config directory and symlinks the rasi config files from the generated wal rasi files in ~/.cache/wal/

config_dir="${HOME}/.config/rofi"

if [ ! -d "${config_dir}" ] ; then
	mkdir -p "${config_dir}"
fi

ln -s ~/.cache/wal/rofi-colors.rasi ~/.config/rofi/colors.rasi
ln -s ~/.cache/wal/rofi-simple-config.rasi ~/.config/rofi/simple-config.rasi
ln -s ~/.cache/wal/rofi-powermenu-config.rasi ~/.config/rofi/powermenu-config.rasi
ln -s ~/.cache/wal/rofi-launcher-config.rasi ~/.config/rofi/launcher-config.rasi
ln -s ~/.cache/wal/rofi-wallpaper-sel.rasi ~/.config/rofi/wallpaper-sel-config.rasi
