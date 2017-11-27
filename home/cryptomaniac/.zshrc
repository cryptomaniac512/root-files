source ~/.antigen/antigen.zsh 

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundle git
antigen bundle django
antigen bundle golang
antigen bundle npm
antigen bundle pip
antigen bundle pyenv
antigen bundle virtualenv
antigen bundle yarn
antigen bundle cryptomaniac512/goto-project completions/zsh

antigen bundle bil-elmoussaoui/flatpak-zsh-completion
# stupid problem - this bundle does not loaded automatically
source ~/.antigen/bundles/bil-elmoussaoui/flatpak-zsh-completion/flatpak/flatpak.plugin.zsh 

antigen theme terminalparty

antigen apply

alias dev="cd ~/Devel/"
alias dev-projects="cd ~/Devel/Projects/"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"

export PATH="$HOME/.local/bin:$PATH"

PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
[ -f /home/cryptomaniac/.travis/travis.sh ] && source /home/cryptomaniac/.travis/travis.sh

NPM_PACKAGES="$HOME/.npm-packages"
export PATH="$NPM_PACKAGES/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
