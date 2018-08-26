ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

all:
	@echo "Installing dotfiles"
	mkdir -p $(HOME)/.config/nvim
	mkdir -p $(HOME)/.config/git
	mkdir -p $(HOME)/.ssh
	ln -sf $(ROOT_DIR)/aliases $(HOME)/.aliases
	ln -sf $(ROOT_DIR)/tmux.conf $(HOME)/.tmux.conf
	ln -sf $(ROOT_DIR)/nvimrc $(HOME)/.config/nvim/init.vim
	ln -sf $(ROOT_DIR)/sshconfig $(HOME)/.ssh/config
	ln -sf $(ROOT_DIR)/zshrc $(HOME)/.zshrc
	ln -sf $(ROOT_DIR)/zshenv $(HOME)/.zshenv
	ln -sf $(ROOT_DIR)/zlogin $(HOME)/.zlogin
	ln -sf $(ROOT_DIR)/zprofile $(HOME)/.zprofile
	ln -sf $(ROOT_DIR)/gitconfig $(HOME)/.config/git/config
	ln -sf $(ROOT_DIR)/gitignore $(HOME)/.config/git/ignore
	ln -sf $(ROOT_DIR)/gitmessage $(HOME)/.config/git/message
