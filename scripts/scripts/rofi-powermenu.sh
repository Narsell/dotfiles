#!/usr/bin/env bash

# CMDs
lastlogin="`last $USER | head -n1 | tr -s ' ' | cut -d' ' -f5,6,7`"
uptime="`uptime -p | sed -e 's/up //g;s/ minutes/m/g;s/ hours*,/h/g'`"

# Options
hibernate=' '
shutdown='󰐥'
reboot=' '
lock='󰌾'
suspend='󰤄'
logout='󰍃'
yes=''
no=' ' 

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "  $USER" \
		-mesg "  Uptime: $uptime" \
		-config powermenu-config.rasi
}

# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 350px;}' \
		-theme-str 'mainbox {orientation: vertical; children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you sure?' \
		-config powermenu-config.rasi
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$reboot\n$logout\n$suspend\n$shutdown\n$hibernate" | rofi_cmd
}

# Execute Command
run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		if [[ $1 == '--shutdown' ]]; then
			systemctl poweroff || loginctl poweroff
		elif [[ $1 == '--reboot' ]]; then
			systemctl reboot || loginctl reboot
		elif [[ $1 == '--hibernate' ]]; then
			systemctl hibernate
		elif [[ $1 == '--suspend' ]]; then
			mpc -q pause
			amixer set Master mute
			systemctl suspend
		elif [[ $1 == '--logout' ]]; then
			pkill Hyprland || pkill sway || pkill niri || loginctl terminate-u    ser $USER	
		fi
	else
		exit 0
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
		run_cmd --shutdown
        ;;
    $reboot)
		run_cmd --reboot
        ;;
    $hibernate)
		run_cmd --hibernate
        ;;
    $lock)
       	hyprlock 
		;;
    $suspend)
		run_cmd --suspend
        ;;
    $logout)
		run_cmd --logout
        ;;
esac
