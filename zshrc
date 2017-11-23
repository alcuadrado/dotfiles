ZSH=$HOME/.oh-my-zsh
ZSH_THEME="../custom/themes/alcuadrado"
plugins=(git docker docker-compose brew zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# remove oh my zsh aliases
unalias -m '*'

#autocomplete on dir path
zstyle ':completion:*' special-dirs ..

#extra completions
fpath=(/usr/local/share/zsh-completions $fpath)

#some config
export EDITOR=vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH=$HOME/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

#AUTO_TITLE conflicts with tmux
export DISABLE_AUTO_TITLE=true

#aliases
alias axel='axel -a'
alias aspell\-latex="aspell -l es -t -x check"
alias gitroot='cd "$(git rev-parse --show-toplevel)"'
alias dc='docker-compose'

#FZF

source $HOME/.dotfiles/fzf.zsh

#golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin


# perl
PATH="/Users/pato/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/Users/pato/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/pato/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/pato/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/pato/perl5"; export PERL_MM_OPT;

# Android
export PATH=$PATH:/Users/pato/Library/Android/sdk/platform-tools
export PATH=$PATH:/Users/pato/Library/Android/sdk/tools

# Colored man pages
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

# Cargo
source $HOME/.cargo/env

# Node
export PATH=$PATH:$(yarn global bin)

if [ -z "$TMUX" ]; then exec tmux; fi
