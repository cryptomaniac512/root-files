# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

alias backoffice="cd ~/Devel/Projects/backoffice/src/ && source ~/Devel/Envs/py3_backoffice/bin/activate"
alias cmblog="cd ~/Devel/Projects/cmblog/ && source ~/Devel/Envs/py3_cmblog/bin/activate"

PS1='[\u@\h \W]\$ '

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"

export PATH="$HOME/.local/bin:$PATH"

NPM_PACKAGES="$HOME/.npm-packages"
export PATH="$NPM_PACKAGES/bin:$PATH"
