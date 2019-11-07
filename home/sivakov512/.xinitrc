nitrogen --restore
redshift &
# blueman-applet &
start-pulseaudio-x11

exec ck-launch-session dbus-launch --sh-syntax --exit-with-x11 i3
