export WINIT_HIDPI_FACTOR=1.0
export EDITOR=vim

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --ignore-file .gitignore --exclude .git'

if [ -z "$DISPLAY" ] && [ -n "$TTY" ] && [ "$TTY" = /dev/tty1 ]; then
  exec startx
fi
