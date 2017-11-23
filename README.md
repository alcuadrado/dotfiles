# Dotfiles

Just my dotfiles, which are based in stuff I found on the web and my friends'
recommendations.

Feel free to grab whatever you want.

# Installation

Install vim, tmux, fzf and git and run:

```
$ git clone https://github.com/alcuadrado/dotfiles.git ~/.dotfiles

# zsh
$ git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
$ ln -s ~/.dotfiles/zshrc ~/.zshrc
$ mkdir -p ~/.oh-my-zsh/custom/themes
$ mkdir -p ~/.oh-my-zsh/custom/plugins
$ git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
$ ln -s ~/.dotfiles/alcuadrado.zsh-theme ~/.oh-my-zsh/custom/themes

# vim
$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
$ ln -s ~/.dotfiles/vimrc ~/.vimrc

$ ln -s ~/.dotfiles/tmux.conf ~/tmux.conf
$ ln -s ~/.dotfiles/bpython ~/.bpython
$ ln -s ~/.dotfiles/gitconfig ~/.gitconfig
```

On mac finish fzf installation with:

```
$(brew --prefix)/opt/fzf/install
```

Launch vim and run `:PluginInstall`

```
$ cd ~/.vim/bundle/YouCompleteMe
$ ./install.sh
```

# OS X specific dependencies

Install `reattach-to-user-namespace` and `zsh-completions` via Homebrew
