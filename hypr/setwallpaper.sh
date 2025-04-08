# ~/wallpapers/$(ls ~/wallpapers/ | rofi -dmenu)
dir=~/wallpapers/

wallpaper="$(cd) $dir$(ls $dir | rofi -dmenu)"

if [ -z "$wallpaper" ]; then
    exit 1
else
    hyprctl hyprpaper reload ", $wallpaper"
    echo "$1"
fi
