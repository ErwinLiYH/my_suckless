
# enable natural scrolling and tap-to-click
touchpad_id=$(xinput list | grep -o "Touchpad.*id=[0-9]*" | sed "s/Touchpad.*id=//")
natural_scrolling_id=$(xinput list-props ${touchpad_id} | grep -o "libinput Natural Scrolling Enabled ([0-9]*)" | sed "s/libinput Natural Scrolling Enabled (//" | sed "s/)//")
tap_click_id=$(xinput list-props ${touchpad_id} | grep -o "libinput Tapping Enabled ([0-9]*)" | sed "s/libinput Tapping Enabled (//" | sed "s/)//")
xinput set-prop ${touchpad_id} ${natural_scrolling_id} 1
xinput set-prop ${touchpad_id} ${tap_click_id} 1

# xrandr

# feh wallpaper
feh --bg-fill /usr/share/backgrounds/archlinux/archwave.png

exec dwm
