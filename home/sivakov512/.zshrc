source ~/.antigen/antigen.zsh 

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundle django
antigen bundle npm
antigen bundle pip
antigen bundle virtualenv
antigen bundle yarn
antigen bundle cargo
antigen bundle rust
antigen bundle docker
antigen bundle sivakov512/goto-project-rs completions/zsh

antigen bundle bil-elmoussaoui/flatpak-zsh-completion

# fzf settings for zsh
source /usr/share/doc/fzf/completion.zsh
source /usr/share/doc/fzf/key-bindings.zsh

antigen theme terminalparty

antigen apply

alias dev="cd ~/Devel/"
alias dev-projects="cd ~/Devel/Projects/"

alias pip-user-update="pip freeze --user | cut -d'=' -f1 | xargs pip install --user -U"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
