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
antigen bundle cargo
antigen bundle rust
antigen bundle docker
antigen bundle sivakov512/goto-project-rs completions/zsh

antigen bundle bil-elmoussaoui/flatpak-zsh-completion
# stupid problem - this bundle does not loaded automatically
source ~/.antigen/bundles/bil-elmoussaoui/flatpak-zsh-completion/flatpak/flatpak.plugin.zsh 

# fzf settings for zsh
source /usr/share/doc/fzf/completion.zsh
source /usr/share/doc/fzf/key-bindings.zsh

antigen theme terminalparty

antigen apply

alias dev="cd ~/Devel/"
alias dev-projects="cd ~/Devel/Projects/"

alias crun="cargo run"
alias cnew="cargo new"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
