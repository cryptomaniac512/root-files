# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

export WINIT_HIDPI_FACTOR=1.0

export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

export PATH="$HOME/.local/bin:$PATH"

PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
[ -f /home/cryptomaniac/.travis/travis.sh ] && source /home/cryptomaniac/.travis/travis.sh

NPM_PACKAGES="$HOME/.npm-packages"
export PATH="$NPM_PACKAGES/bin:$PATH"

if [ -z "$DISPLAY" ] && [ -n "$TTY" ] && [ "$TTY" = /dev/tty1 ]; then
  exec startx
fi
