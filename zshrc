export ZSH="/Users/adrian/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# Zplug
source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
# Zplug

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[[ -s "/Users/adrian/.gvm/scripts/gvm" ]] && source "/Users/adrian/.gvm/scripts/gvm"

# GVM
export GOPATH=$HOME/Code/go-workspace
export PATH=$PATH:$GOPATH/bin

# opam configuration
test -r /Users/adrian/.opam/opam-init/init.zsh && . /Users/adrian/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# source aliases
[ -s "$HOME/.aliases" ] && source "$HOME/.aliases"

# fzf sourcing
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
