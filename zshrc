# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_GB.UTF-8

# Editors
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias emacs="nvim"

# tmux
alias tns="tmux new -s"
alias tls="tmux ls"
alias ta="tmux a -t"
alias tks="tmux kill-session -t"

# docker
alias dim="docker images"
alias dprune="docker system prune --all"
alias dps="docker ps --format \"table {{.Names}}\t{{.Status}}\t{{.ID}}\t{{.Ports}}\""
alias dpsa="docker ps -a --format \"table {{.Names}}\t{{.Status}}\t{{.ID}}\t{{.Ports}}\""
alias dpsal="docker ps -a"
alias dpsl="docker ps"
alias drm="docker rm"
alias drmA="docker rm \$(docker ps -a -q)"
alias drmAf="docker rm -f \$(docker ps -a -q)"
alias drmi="docker rmi"
alias drmiA="docker rmi \$(docker images -q)"
alias dsA="docker stop \$(docker ps -a -q)"

# git
alias gb="git branch"
alias gbc="git branch | grep \* | cut -d ' ' -f2"
alias gbsu="git branch --set-upstream-to=origin/\$(gbc) \$(gbc)"
alias gbD="gb -D"
alias gbd="gb -d"
alias gbDi="gb | fzf -m | xargs git branch -D"
alias gbdi="gb | fzf -m | xargs git branch -d"
alias gc="git commit --verbose"
alias gcam="gc --amend"
alias gcf="gcam --reuse-message HEAD"
alias gcm="git commit --message"
alias gco="git checkout"
alias gl="git log --topo-order --pretty=format:'%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'"
alias glog="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
alias gwd="git diff --no-ext-diff --patch-with-stat"
alias gwdc="gwd --cached"
alias gws="git status --short"
alias gpa="ls | xargs -P8 -I{} sh -c 'git -C {} pull --all && git -C {} checkout master; git -C {} pull; git -C {} checkout stable; git -C {} pull; echo {}'"

# misc
alias cls="clear; ls"
alias exs="source ~/.zshrc"

# listing
case `uname` in
  Darwin)
    # commands for OS X go here
    alias ls="gls -Fh --color --group-directories-first"
    alias l="gls -1A"
    alias la="gls -lA"
    alias ll="gla"
    alias lk="gla -S"
  ;;
  Linux)
    # commands for Linux go here
    alias ls="ls -Fh --color --group-directories-first"
    alias l="ls -1A"
    alias la="ls -lA"
    alias ll="la"
    alias lk="la -S"
  ;;
esac

# gpg
case `uname` in
  Darwin)
    # commands for OS X go here
    # Add the following to your shell init to set up gpg-agent automatically for every shell
    if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
	    source ~/.gnupg/.gpg-agent-info
	    export GPG_AGENT_INFO
    else
	    eval $(gpg-agent --daemon ~/.gnupg/.gpg-agent-info)
    fi
  ;;
  Linux)
    alias gpg="gpg2"
  ;;
esac





# dotfile editing
alias nvimrc="$EDITOR $HOME/.config/nvim/init.vim"
alias zshrc="$EDITOR $HOME/.zshrc"
alias ohmyzsh="nvim $HOME/.oh-my-zsh"

# Go
## GVM
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
export GOPATH=$HOME/code/go-workspace
export PATH=$PATH:$GOPATH/bin

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Yarn
## https://yarnpkg.com/lang/en/docs/install/
alias nodejs=node

# Zplug
source ~/.zplug/init.zsh
#
# Install plugins if there are plugins that have not been installed
if ! zplug check; then
        zplug install
fi
#
# Self management for zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "plugins/colored-man-pages", from:oh-my-zsh
#
# Then, source plugins and add commands to $PATH
zplug load

# source FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#
# use rg for fzf
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/*'"

# command history please
HISTFILE=~/.zhistory
HISTSIZE=100000
SAVEHIST=100000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY # share history between sessions
setopt EXTENDED_HISTORY # add timestamps to history
setopt HIST_REDUCE_BLANKS

[ -s "/Users/avo/.jabba/jabba.sh" ] && source "/Users/avo/.jabba/jabba.sh"

# Haskell
export PATH="$PATH:PATH$HOME/.local/bin"

# OPAM configuration
. /Users/avo/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
