#!/bin/bash
# Sets up the links from pywal's generated templates to their appropriate directories.

config_dir="${HOME}/.config/rofi"

if [ ! -d "${config_dir}" ] ; then
	mkdir -p "${config_dir}"
fi

# Rofi
ln -s ~/.cache/wal/rofi-colors.rasi ~/.config/rofi/colors.rasi
ln -s ~/.cache/wal/rofi-simple-config.rasi ~/.config/rofi/simple-config.rasi
ln -s ~/.cache/wal/rofi-powermenu-config.rasi ~/.config/rofi/powermenu-config.rasi
ln -s ~/.cache/wal/rofi-launcher-config.rasi ~/.config/rofi/launcher-config.rasi
ln -s ~/.cache/wal/rofi-wallpaper-sel.rasi ~/.config/rofi/wallpaper-sel-config.rasi

# Obsidian theme
ln -s ~/.cache/wal/obsidian_template.css ~/Documents/Obsidian/Meditations/.obsidian/themes/Pywal/theme.css

# Calibre theme
ln -s ~/.cache/wal/pywal.calibre-palette ~/.config/calibre/palettes/pywal.calibre-palette
