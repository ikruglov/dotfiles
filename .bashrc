# .bashrc

# Source global definitions
if [ -r /etc/bashrc ]; then
    . /etc/bashrc
fi

if [ -f $HOME/.ssh/config ]; then
    chmod 600 $HOME/.ssh/config
fi

os=$(uname -s)

# General settings
export EDITOR=vim
export LANG=en_US.UTF-8
export PATH="$HOME/bin:$PATH:/sbin:/usr/sbin"
if [[ $os == 'Darwin' ]]; then
    export PATH="/usr/local/sbin:/opt/local/bin:/opt/local/sbin:$PATH"
fi

if [[ -r "$HOME/go/bin" ]]; then
    export PATH="$HOME/go/bin:$PATH"
fi

export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S:"
export HISTCONTROL="ignoredups:ignorespace"
export HISTFILESIZE=100000
export HISTSIZE=100000

# Setup colors
if [ -r $HOME/.bash_colors ]; then
    . $HOME/.bash_colors
fi

# Setup PS1 colors
export PS1_COLOR=$Green
if [[ $(id -nu) == 'ivan.kruglov' ]] || [[ $(id -nu) == 'ikruglov' ]]; then
    export PS1="\[$PS1_COLOR\]\h\[$IBlue\] \W\[$Cyan\] $ \[$Color_Off\]"
elif [[ $(id -u) -eq 0 ]]; then
    export PS1="\[$On_IRed\]\u\[$Color_Off\] \[$PS1_COLOR\]\h\[$IBlue\] \W\[$Cyan\] $ \[$Color_Off\]"
else
    export PS1="\[$IRed\]\u\[$Color_Off\] \[$PS1_COLOR\]\h\[$IBlue\] \W\[$Cyan\] $ \[$Color_Off\]"
fi

# Setup ls colors
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

if [ -r $HOME/.bash_corporate ]; then
    . $HOME/.bash_corporate
fi

if [ -r $HOME/.bash_secrets ]; then
    source $HOME/.bash_secrets
fi

# Load bash completions
if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
fi

# setup GPG 2.1
# which gpg-agent > /dev/null 2>&1
# if [[ $? -eq 0 ]]; then
    # SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"
    # export SSH_AUTH_SOCK
    # /usr/local/bin/gpg-agent --daemon > /dev/null 2>&1
# fi

export BASH_SILENCE_DEPRECATION_WARNING=1
