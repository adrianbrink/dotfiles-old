ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

dotfiles:
	@echo "Setting up dotfiles"
	mkdir -p $(HOME)/.config/nvim
	mkdir -p $(HOME)/.config/git
	mkdir -p $(HOME)/.gnupg
	ln -sf $(ROOT_DIR)/gpg-agent.conf $(HOME)/.gnupg/gpg-agent.conf
	ln -sf $(ROOT_DIR)/gpg.conf $(HOME)/.gnupg/gpg.conf
	ln -sf $(ROOT_DIR)/nvimrc $(HOME)/.config/nvim/init.vim
	ln -sf $(ROOT_DIR)/zshrc $(HOME)/.zshrc
	ln -sf $(ROOT_DIR)/zshenv $(HOME)/.zshenv
	ln -sf $(ROOT_DIR)/zprofile $(HOME)/.zprofile
	ln -sf $(ROOT_DIR)/zlogin $(HOME)/.zlogin
	ln -sf $(ROOT_DIR)/tmux.conf $(HOME)/.tmux.conf
	ln -sf $(ROOT_DIR)/gitconfig $(HOME)/.config/git/config
	ln -sf $(ROOT_DIR)/gitignore $(HOME)/.config/git/ignore

.PHONY: dotfiles
