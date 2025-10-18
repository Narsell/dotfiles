#!/usr/bin/env bash

# Simple script that toggles the active keyboard layout and sends a notification via notify-send.
# author: @narsell

hyprctl switchxkblayout current next 

LAYOUT_NAME=$(hyprctl -j devices | jq -r '.keyboards[] | select(.main == true) | .active_keymap')

notify-send "Keyboard Layout" "$LAYOUT_NAME" -u low --expire-time=1400
