#!/usr/bin/env bash
# author: @narsell

# Script to toggle on or off a given monitor

if [[ -z "$1" ]]; then
	echo "ERROR: Expected monitor name! Get it from 'hyprctl monitors'"
	exit 1
fi

declare -A MONITOR_POS=(
	["HDMI-A-1"]="0x0"
	["DP-1"]="2560x0"
)
declare -A MONITOR_RES=(
	["HDMI-A-1"]="2560x1440@120"
	["DP-1"]="preferred"
)

MONITOR_NAME=$1
MONITOR_CONNECTED=$(hyprctl monitors | grep -c "^Monitor $MONITOR_NAME\b") # 1 if monitor is enabled, 0 otherwise. Note there might be an edge case where the monitor is listed but it has disabled:true; not sure how or when that happens though.
if [[ "$MONITOR_CONNECTED" -ge 1 ]]; then	
	echo "Trying to disable $MONITOR_NAME"
	hyprctl keyword monitor "$MONITOR_NAME, disable"	
else
	if [[ -z "${MONITOR_RES[$MONITOR_NAME]}" || -z "${MONITOR_POS[$MONITOR_NAME]}" ]]; then
		echo "ERROR: Missing settings for $MONITOR_NAME!"
		exit 1
	fi
	ENABLE_SETTINGS="$MONITOR_NAME, ${MONITOR_RES[$MONITOR_NAME]}, ${MONITOR_POS[$MONITOR_NAME]}, 1.00"
	echo "Trying to enable $MONITOR_NAME: $ENABLE_SETTINGS"
	hyprctl keyword monitor "$ENABLE_SETTINGS"
fi

