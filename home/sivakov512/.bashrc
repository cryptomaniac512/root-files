# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto'
alias l='ls -lsha --color=auto'

source /usr/share/doc/fzf/key-bindings.bash

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
