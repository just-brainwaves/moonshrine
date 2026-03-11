# #!/bin/bash
# # Directory containing wallpapers
# WALLPAPER_DIR="$HOME/Pictures/Wallpapers/"

# # Get current wallpaper from swww
# CURRENT=$(swww query | awk -F 'image: ' '{print $2}')

# # Select next image (alphabetical order, loops back)
# NEXT_WALLPAPER=$(find "$WALLPAPER_DIR" -type f | grep -E "\.(jpg|png|jpeg|gif)$" | sort | awk -v current="$CURRENT" '$0 == current {getline; print; exit} END {if (NR==0) print "first_image"}' | head -n1)

# # If no next image, get the first one to loop
# if [ -z "$NEXT_WALLPAPER" ]; then
#     NEXT_WALLPAPER=$(find "$WALLPAPER_DIR" -type f | grep -E "\.(jpg|png|jpeg|gif)$" | sort | head -n1)
# fi

# # Apply wallpaper with transition
# swww img "$NEXT_WALLPAPER" --transition-type center



#!/bin/bash
# Directory containing wallpapers
WALLPAPER_DIR="$HOME/Pictures/Wallpapers/"

# 1. Get all images into an array (sorted)
PICS=($(find "$WALLPAPER_DIR" -maxdepth 1 -type f | grep -E "\.(jpg|png|jpeg|gif)$" | sort))

# 2. Get the current wallpaper path from swww
CURRENT=$(swww query | awk -F 'image: ' '{print $2}')

# 3. Find the index of the current wallpaper
NEXT_WALLPAPER=""
for i in "${!PICS[@]}"; do
   if [[ "${PICS[$i]}" == "$CURRENT" ]]; then
       # Pick the next index, or 0 if we are at the end
       NEXT_INDEX=$(( (i + 1) % ${#PICS[@]} ))
       NEXT_WALLPAPER="${PICS[$NEXT_INDEX]}"
       break
   fi
done

cursor=$(hyprctl cursorpos | tr -d ' ')

# 4. Fallback: If current isn't found (e.g. first run), pick the first image
if [ -z "$NEXT_WALLPAPER" ]; then
    NEXT_WALLPAPER="${PICS[0]}"
fi

# 5. Apply
swww img "$NEXT_WALLPAPER" --transition-type grow --transition-pos $cursor --invert-y --transition-duration 2 --transition-fps 60
