#!/bin/bash
#  ██╗    ██╗ █████╗ ██╗     ██╗     ██████╗  █████╗ ██████╗ ███████╗██████╗
#  ██║    ██║██╔══██╗██║     ██║     ██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗
#  ██║ █╗ ██║███████║██║     ██║     ██████╔╝███████║██████╔╝█████╗  ██████╔╝
#  ██║███╗██║██╔══██║██║     ██║     ██╔═══╝ ██╔══██║██╔═══╝ ██╔══╝  ██╔══██╗
#  ╚███╔███╔╝██║  ██║███████╗███████╗██║     ██║  ██║██║     ███████╗██║  ██║
#   ╚══╝╚══╝ ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝     ╚═╝  ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝
#
#  ██╗      █████╗ ██╗   ██╗███╗   ██╗ ██████╗██╗  ██╗███████╗██████╗
#  ██║     ██╔══██╗██║   ██║████╗  ██║██╔════╝██║  ██║██╔════╝██╔══██╗
#  ██║     ███████║██║   ██║██╔██╗ ██║██║     ███████║█████╗  ██████╔╝
#  ██║     ██╔══██║██║   ██║██║╚██╗██║██║     ██╔══██║██╔══╝  ██╔══██╗
#  ███████╗██║  ██║╚██████╔╝██║ ╚████║╚██████╗██║  ██║███████╗██║  ██║
#  ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
#	
#	Heavily inspired by:  develcooking - https://github.com/develcooking/hyprland-dotfiles	
# Info    - This script runs the rofi launcher, to select
#             the wallpapers included in the theme you are in.

# Set some variables
wall_dir="${HOME}/Pictures/Wallpapers/"
cache_dir="${HOME}/.cache/thumbnails/wal_selector"
rofi_config_path="${HOME}/.config/rofi/wallpaper-sel-config.rasi "
rofi_command="rofi -dmenu -config ${rofi_config_path} -theme-str ${rofi_override}"

# Create cache dir if not exists
if [ ! -d "${cache_dir}" ] ; then
        mkdir -p "${cache_dir}"
fi

# Convert images in directory and save to cache dir
for imagen in "$wall_dir"/*.{jpg,jpeg,png,webp}; do
	if [ -f "$imagen" ]; then
		filename=$(basename "$imagen")
			if [ ! -f "${cache_dir}/${filename}" ] ; then
				magick convert -strip "$imagen" -thumbnail 500x500^ -gravity center -extent 500x500 "${cache_dir}/${filename}"
			fi
    fi
done

# Select a picture with rofi
wall_selection=$(ls "${wall_dir}" -t | while read -r A ; do  echo -en "$A\x00icon\x1f""${cache_dir}"/"$A\n" ; done | $rofi_command)

# Set the wallpaper with waypaper
[[ -n "$wall_selection" ]] || exit 1
waypaper --wallpaper ${wall_dir}${wall_selection}

exit 0

