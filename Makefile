ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

ubuntu:
	@echo "Setting up Ubuntu"
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

macos:
	echo "Setting up MacOS"

.PHONY: ubuntu
