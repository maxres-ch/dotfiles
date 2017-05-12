#!/usr/bin/make -d


depends:
	sudo apt-get install stow vim-gtk tmux zsh fonts-powerline cmake
	
dotfiles:
	# TODO this doesn't scale
	stow vim -t $(HOME)
	stow tmux -t $(HOME)
	stow psql -t $(HOME)
	stow zsh -t $(HOME)

vim-plugins: dotfiles
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall

ycm:
	cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer

tmux-plugins: dotfiles
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	echo "Remember to use 'prefix +I to install tmux plugin'"

vim: vim-plugins ycm
	ehco "Vim and Family installed"

install: depends vim-plugins tmux-plugins
	echo "Installing Dotfiles Completed"

