# Dotfiles

Just my dotfiles, which are based in stuff I found on the web and my friends'
recommendations.

Feel free to grab whatever you want.

# Installation

Install vim, reattach-to-user-namespace, tmux, fzf and git and run:

```bash
git clone --recurse-submodules --remote-submodules https://github.com/alcuadrado/dotfiles.git ~/.dotfiles

# zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
ln -s ~/.dotfiles/zshrc ~/.zshrc

# vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s ~/.dotfiles/vimrc ~/.vimrc

ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/bpython ~/.bpython
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/alacritty.yml ~/.alacritty.yml
```

On mac finish fzf installation with:

```
$(brew --prefix)/opt/fzf/install
```

Launch vim and run `:PluginInstall`

```

# OS X specific dependencies

Install `zsh-completions` via Homebrew

