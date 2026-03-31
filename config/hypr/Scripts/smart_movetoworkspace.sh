#!/bin/bash
KEY=$1

CURSOR=$(hyprctl cursorpos -j)
CX=$(echo "$CURSOR" | jq '.x')
CY=$(echo "$CURSOR" | jq '.y')

CURRENT_MON=$(hyprctl monitors -j | jq -r --argjson cx "$CX" --argjson cy "$CY" '
  .[] | select(
    .x <= $cx and $cx < (.x + .width) and
    .y <= $cy and $cy < (.y + .height)
  ) | .name
')

PRIMARY="eDP-1"

if [ "$CURRENT_MON" = "$PRIMARY" ]; then
    hyprctl dispatch movetoworkspace "$KEY"
else
    TARGET=$((KEY + 5))
    hyprctl dispatch movetoworkspace "$TARGET"
fi