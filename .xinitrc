# tap to click mouse functionality
xinput set-prop 10 288 1

# status bar
while true
do
    TIME=$(date +"%A %b %d %R")
    BAT="$(acpi -b | awk '{ print $4 }' | tr -d ',')"
    xsetroot -name " [ $BAT ] [ $TIME ] "
    sleep 60s
done &

# start dwm
exec dwm
