# ~/wallpapers/$(ls ~/wallpapers/ | rofi -dmenu)
dir=~/wallpapers/

wallpaper="$(ls $dir | rofi -dmenu)"
wallpaperdir="$(cd) $dir$wallpaper"

echo $wallpaper
echo $wallpaperdir

if [ -z "$wallpaper" ]; then
    exit 1
else
    hyprctl hyprpaper reload ", $wallpaperdir"
    exit 0
fi
