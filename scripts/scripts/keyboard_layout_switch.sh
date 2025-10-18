#!/usr/bin/env bash
hyprctl switchxkblayout current next 

LAYOUT_NAME=$(hyprctl -j devices | jq -r '.keyboards[] | select(.main == true) | .active_keymap')

notify-send "Keyboard layout change" "$LAYOUT_NAME" -u low --expire-time=1000
