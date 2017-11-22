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

antigen bundle bil-elmoussaoui/flatpak-zsh-completion
# stupid problem - this bundle does not loaded automatically
source ~/.antigen/bundles/bil-elmoussaoui/flatpak-zsh-completion/flatpak/flatpak.plugin.zsh 

antigen theme terminalparty

antigen apply

alias dev="cd ~/Devel/"
alias dev-projects="cd ~/Devel/Projects/"

alias LanguageClient-neovim="cd ~/Devel/Projects/LanguageClient-neovim/ && source ~/Devel/Envs/py3_LanguageClient-neovim/bin/activate"
alias backoffice="cd ~/Devel/Projects/backoffice/src/ && source ~/Devel/Envs/py3_backoffice/bin/activate"
alias blog-api="cd ~/Devel/Projects/blog-api/ && source ~/Devel/Envs/py3_blog_api/bin/activate"
alias cryptomaniac512.github.io="cd ~/Devel/Projects/cryptomaniac512.github.io/"
alias insta="cd ~/Devel/Projects/insta/ && source ~/Devel/Envs/py3_insta/bin/activate"
alias markdown-full-yaml-metadata="cd ~/Devel/Projects/python-markdown-full-yaml-metadata/ && source ~/Devel/Envs/py3_markdown_full_yaml_metadata/bin/activate"
alias md-loader="cd ~/Devel/Projects/python-static-api-generator-md-loader/ && source ~/Devel/Envs/py3_static_api_generator_md_loader/bin/activate"
alias root-files="cd ~/Devel/Projects/root-files/"
alias static-api-generator="cd ~/Devel/Projects/python-static-api-generator/ && source ~/Devel/Envs/py3_static_api_generator//bin/activate"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"

export PATH="$HOME/.local/bin:$PATH"

PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
[ -f /home/cryptomaniac/.travis/travis.sh ] && source /home/cryptomaniac/.travis/travis.sh

NPM_PACKAGES="$HOME/.npm-packages"
export PATH="$NPM_PACKAGES/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
