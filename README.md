# Dotfiles

Just my dotfiles, which are based in stuff I found on the web and my friends'
recommendations.

Feel free to grab whatever you want.

# Installation

Install vim, tmux, and git and run:

`
$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
$ git clone https://github.com/alcuadrado/dotfiles.git ~/.dotfiles
$ ln -s ~/.dotfiles/vimrc ~/.vimrc
$ ln -s ~/.dotfiles/tmux.conf ~/tmux.conf
`

Launch vim and run `:PluginInstall`

# OSX Specific dependencies

Install `reattach-to-user-namespace`
