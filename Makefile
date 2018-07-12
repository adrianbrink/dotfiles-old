ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

dotfiles:
	@echo "Setting up dotfiles"
	mkdir -p $(HOME)/.config/nvim
	mkdir -p $(HOME)/.config/git
	ln -sf $(ROOT_DIR)/nvim/init.vim $(HOME)/.config/nvim/init.vim
	ln -sf $(ROOT_DIR)/zshrc $(HOME)/.zshrc
	ln -sf $(ROOT_DIR)/zshenv $(HOME)/.zshenv
	ln -sf $(ROOT_DIR)/zprofile $(HOME)/.zprofile
	ln -sf $(ROOT_DIR)/zlogin $(HOME)/.zlogin
	ln -sf $(ROOT_DIR)/git/config $(HOME)/.config/git/config
	ln -sf $(ROOT_DIR)/git/ignore $(HOME)/.config/git/ignore

.PHONY: dotfiles
