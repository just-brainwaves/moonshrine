#!/bin/bash
# Usage: smart_workspace.sh <1-5>

KEY=$1

# Get cursor position
CURSOR=$(hyprctl cursorpos -j)
CX=$(echo "$CURSOR" | jq '.x')
CY=$(echo "$CURSOR" | jq '.y')

# Find which monitor the cursor is currently on
CURRENT_MON=$(hyprctl monitors -j | jq -r --argjson cx "$CX" --argjson cy "$CY" '
  .[] | select(
    .x <= $cx and $cx < (.x + .width) and
    .y <= $cy and $cy < (.y + .height)
  ) | .name
')

# ⚠️  Set your PRIMARY monitor name here (run `hyprctl monitors` to find it)
PRIMARY="eDP-1"

if [ "$CURRENT_MON" = "$PRIMARY" ]; then
    # Cursor on primary → use workspace 1-5 as normal
    hyprctl dispatch workspace "$KEY"
else
    # Cursor on secondary → remap 1→6, 2→7, 3→8, 4→9, 5→10
    TARGET=$((KEY + 5))
    hyprctl dispatch workspace "$TARGET"
fi