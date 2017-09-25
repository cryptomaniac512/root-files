nitrogen --restore
start-pulseaudio-x11 &
redshift &

dbus-launch
exec ck-launch-session i3
