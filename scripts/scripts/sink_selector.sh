#!/bin/sh

# Create a list of sinks with pretty names
options=$(pactl -f json list sinks | jq -r '.[] | .description')

# Let the user select a description
selection=$(printf "$options" | wofi -i -b -W 40% -L 5 -p "Audio Sink"  --dmenu)

# Extract the corresponding sink name
sink_name=$(pactl -f json list sinks | jq -r --arg sink_pretty_name "$selection" '.[] | select(.description == $sink_pretty_name) | .name')

notif_title="Sink Switch"

# Set the selected sink as default
if [ -n "$sink_name" ]; then
    pactl set-default-sink "$sink_name" && notify-send -u low -a "$notif_title" "$notif_title" "$selection"
else
	echo ""
fi
