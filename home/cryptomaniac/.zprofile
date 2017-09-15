if [ -z "$DISPLAY" ] && [ -n "$TTY" ] && [ "$TTY" = /dev/tty1 ]; then
  exec startx
fi
