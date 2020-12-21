export WINIT_HIDPI_FACTOR=1.0
export EDITOR=vim

export DENO_INSTALL="$HOME/.deno"
export GOPATH="$HOME/.go/"
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$DENO_INSTALL/bin:$HOME/.npm-packages/bin:$GOPATH/bin:$PATH"

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --ignore-file .gitignore --exclude .git'

[ -f ~/.dir_colors ] && eval $(dircolors ~/.dir_colors)

if [ -z "$DISPLAY" ] && [ -n "$TTY" ] && [ "$TTY" = /dev/tty1 ]; then
  exec startx
fi
