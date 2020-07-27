# start dwm status bar
while true
do
    TIME=$(date +"%A %b %d %R")
    BAT="$(acpi -b | awk '{ print $4 }' | tr -d ',')"
    xsetroot -name " [ $BAT ] [ $TIME ] "
    sleep 60s
done &

# set background image
feh --bg-scale ~/images/wallpaper.*

# start dwm
exec dwm
