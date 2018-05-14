export PATH="$HOME/.cargo/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH="$HOME/.local/bin:$PATH"

PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
[ -f /home/cryptomaniac/.travis/travis.sh ] && source /home/cryptomaniac/.travis/travis.sh
export GEM_HOME=$HOME/.gem
PATH="$GEM_HOME/bin:$PATH"

NPM_PACKAGES="$HOME/.npm-packages"
export PATH="$NPM_PACKAGES/bin:$PATH"

if [ -z "$DISPLAY" ] && [ -n "$TTY" ] && [ "$TTY" = /dev/tty1 ]; then
  exec startx
fi
