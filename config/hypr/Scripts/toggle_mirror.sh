#!/bin/bash
# ╔══════════════════════════════════════════════════════════╗
# ║  toggle_mirror.sh                                       ║
# ║  Place in ~/.config/hypr/Scripts/toggle_mirror.sh       ║
# ║  chmod +x ~/.config/hypr/Scripts/toggle_mirror.sh       ║
# ╚══════════════════════════════════════════════════════════╝
#
# Toggles HDMI-A-1 between:
#   - Mirroring eDP-1 (same content on both screens)
#   - Side-by-side (normal dual monitor mode)

MIRROR_STATE_FILE="/tmp/hypr_mirror_state"

if [ -f "$MIRROR_STATE_FILE" ]; then
    # Currently mirroring — restore side-by-side
    hyprctl keyword monitor "HDMI-A-1,1920x1080@75,1920x0,1"
    rm "$MIRROR_STATE_FILE"
    notify-send "Monitors" "Side-by-side restored" --icon=display
else
    # Not mirroring — enable mirror
    hyprctl keyword monitor "HDMI-A-1,1920x1080@75,0x0,1,mirror,eDP-1"
    touch "$MIRROR_STATE_FILE"
    notify-send "Monitors" "HDMI mirroring laptop screen" --icon=display
fi