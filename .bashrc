# .bashrc

# Source global definitions
if [ -r /etc/bashrc ]; then
    . /etc/bashrc
fi

os=$(uname -s)

# General settings
export EDITOR=vim
export PATH="$HOME/bin:$PATH:/sbin:/usr/sbin"
if [[ $os == 'Darwin' ]]; then
    export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
fi

export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S:"
export HISTCONTROL="ignoredups:ignorespace"
export HISTFILESIZE=100000
export HISTSIZE=100000

# Setup ls colors
if [ -r $HOME/.bash_colors ]; then
    . $HOME/.bash_colors
fi

export CLICOLOR=1
if [[ $os == 'Darwin' || $os == 'FreeBSD' ]]; then
    export LSCOLORS='ExGxfxfxCxdxdxBxBxExEx'
elif [[ $os == 'Linux' ]]; then
    export LS_COLORS='di=1;34;40:ln=1;36;40:so=35;40:pi=35;40:ex=1;32;40:bd=33;40:cd=33;40:su=1;31;40:sg=1;31;40:tw=1;34;40:ow=1;34;40:'
fi

# Source other settings
if [ -r $HOME/.bash_alias ]; then
    . $HOME/.bash_alias
fi

if [ -r $HOME/.bash_booking ]; then
    . $HOME/.bash_booking
fi
