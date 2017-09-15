# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

if [ -z "$DISPLAY" ] && [ -n "$TTY" ] && [ "$TTY" = /dev/tty1 ]; then
  exec startx
fi
