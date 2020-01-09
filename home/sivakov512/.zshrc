source ~/.antigen/antigen.zsh 

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundle pip
antigen bundle npm
antigen bundle cargo
antigen bundle rust
antigen bundle docker
antigen bundle sivakov512/goto-project-rs completions/zsh

antigen theme terminalparty

antigen apply

# fzf settings for zsh
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

alias dev-yandex="cd ~/Devel/Projects/yandex/"
alias dev-main="cd ~/Devel/Projects/main/"

alias pip-user-update="pip freeze --user | cut -d'=' -f1 | xargs pip install --user -U"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
