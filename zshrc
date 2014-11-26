ZSH=$HOME/.oh-my-zsh
ZSH_THEME="../custom/themes/alcuadrado"
plugins=(git golang brew vagrant pip zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

#autocomplete on dir path
zstyle ':completion:*' special-dirs ..

#extra completions
fpath=(/usr/local/share/zsh-completions $fpath)

#some config
export EDITOR=vim
export LANG="en_US.UTF-8"
export PATH=$HOME/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

#AUTO_TITLE conflicts with tmux
export DISABLE_AUTO_TITLE=true

#aliases
alias axel='axel -a'
alias aspell\-latex="aspell -l es -t -x check"
alias tmux='TERM=xterm-256color tmux -u'

#rvm
source /Users/pato/.rvm/scripts/rvm
PATH=$PATH:$HOME/.rvm/bin

#golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

if [ -z "$TMUX" ]; then tmux; fi
