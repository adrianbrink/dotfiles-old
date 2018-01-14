.PHONY: all brew-install dotfiles homebrew hushlogin mac-bits node nvim vim-plug yarn-globals zplug zsh spacemacs

.SILENT: all brew-install dotfiles homebrew hushlogin mac-bits node nvim vim-plug yarn-globals zplug zsh spacemacs

ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

all: homebrew brew-install dotfiles hushlogin mac-bits node vim-plug nvim zsh zplug
	@printf "You're all set\n"

mac-bits:
	defaults write com.apple.dashboard mcx-disabled -boolean YES && killall Dock

hushlogin:
	touch $(HOME)/.hushlogin

homebrew:
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew-install:
	brew bundle

vim-plug:
	curl -fLo $(HOME)/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

dotfiles:
	mkdir -p $(HOME)/.config/nvim
	mkdir -p $(HOME)/.config/git
	ln -sf $(ROOT_DIR)/nvimrc $(HOME)/.config/nvim/init.vim
	ln -sf $(ROOT_DIR)/zshrc $(HOME)/.zshrc
	ln -sf $(ROOT_DIR)/zshenv $(HOME)/.zshenv
	ln -sf $(ROOT_DIR)/zprofile $(HOME)/.zprofile
	ln -sf $(ROOT_DIR)/zlogin $(HOME)/.zlogin
	ln -sf $(ROOT_DIR)/tmux.conf $(HOME)/.tmux.conf
	ln -sf $(ROOT_DIR)/gitconfig $(HOME)/.config/git/config
	ln -sf $(ROOT_DIR)/gitignore $(HOME)/.config/git/ignore

nvim:
	nvim -c PlugInstall -c quitall

zsh:
	sudo sh -c "echo '# homebrew zsh\n/usr/local/bin/zsh' >> /etc/shells"
	chsh -s /usr/local/bin/zsh

zplug:
	zplug install

node:
	echo 'export NVM_DIR="$$HOME/.nvm"; \
	[ -s "$$NVM_DIR/nvm.sh" ] && . "$$NVM_DIR/nvm.sh"; \
	nvm install stable' | zsh
