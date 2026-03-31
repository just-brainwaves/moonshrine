#!/bin/bash

HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')

if [ "$HYPRGAMEMODE" = "1" ]; then
    # === ENABLE GAMING MODE ===
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:shadow:enabled 0;\
        keyword decoration:blur:enabled 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword decoration:rounding 0"

    # Kill unnecessary services
    pkill -x waybar       # status bar
    pkill -x dunst        # notifications
    pkill -x swww-daemon  # wallpaper daemon
    pkill -x eww          # widgets (if using)

    notify-send "🎮 Gaming Mode ON" --expire-time=2000 2>/dev/null || true
    echo "gaming" > /tmp/hypr_gamemode
else
    # === RESTORE NORMAL MODE ===
    hyprctl --batch "\
        keyword animations:enabled 1;\
        keyword decoration:shadow:enabled 1;\
        keyword decoration:blur:enabled 1;\
        keyword general:gaps_in 5;\
        keyword general:gaps_out 10;\
        keyword decoration:rounding 10"

    # Restart services
    waybar &
    dunst &
    swww-daemon &

    notify-send "🖥️ Gaming Mode OFF" --expire-time=2000 2>/dev/null || true
    rm -f /tmp/hypr_gamemode
fi