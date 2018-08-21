# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# rust
## rustup
export PATH="$HOME/.cargo/bin:$PATH"
## racer
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# golang
## gvm
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
export GOPATH=$HOME/code/go-workspace
export PATH=$PATH:$GOPATH/bin

# javascript
## nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# swift
## swiftenv
if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi

# zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

## Install plugins if there are plugins that have not been installed
if ! zplug check; then
        zplug install
fi

## Self management for zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "zsh-users/zsh-completions"

zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "plugins/colored-man-pages", from:oh-my-zsh

## Then, source plugins and add commands to $PATH
zplug load

# java
## jvm
[ -s "$HOME/.jabba/jabba.sh" ] && source "$HOME/.jabba/jabba.sh"

# ocaml
## OPAM configuration
. $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# python
## pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# google-cloud
## gcp sdk
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# haskell
## stack
export PATH=$PATH:$HOME/.local/bin

# rust
## scache
export RUSTC_WRAPPER=sccache

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# ruby
## Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
