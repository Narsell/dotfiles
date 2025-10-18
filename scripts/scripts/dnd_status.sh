#!/usr/bin/env bash

# Simple script to be called from waybar to check the status of the swaync-client dnd flag and display the correct icon.
# author: @narsell

if [[ $(swaync-client -D) == "true" ]]; then
	echo "{\"alt\": \"block-notifs\"}"
else
	echo "{\"alt\": \"allow-notifs\"}"
fi
