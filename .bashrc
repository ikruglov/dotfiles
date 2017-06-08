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

if [ -r $HOME/.bash_secrets ]; then
    source $HOME/.bash_secrets
fi

# Setup Go environment
which go > /dev/null 2>&1
if [[ $? -eq 0 ]]; then
    if [ -d $HOME/gocode ]; then
        export GOPATH="$HOME/gocode"
        export PATH="$PATH:$HOME/gocode/bin"
    fi
fi

# Setup Rust environment
which rustc > /dev/null 2>&1
if [[ $? -eq 0 ]]; then
    export PATH="$PATH:$HOME/.cargo/bin"
fi

# Setup git autocompletion and tree status reporting
if [ -r $HOME/.git-completion.sh ]; then
    . $HOME/.git-completion.sh
fi

#if [ -r $HOME/.git-prompt.sh ]; then
#    . $HOME/.git-prompt.sh
#    export PS1="$PS1 \$(__git_ps1 \"(%s)\") "
#fi

# setup GPG 2.1
SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"
export SSH_AUTH_SOCK
if [ ! -r $SSH_AUTH_SOCK ]; then
    /usr/local/bin/gpg-agent --daemon > /dev/null 2>&1
fi

# setup pre GPG 2.1
# GPG_AGENT_FILE="$HOME/.gpg-agent-info"
# /usr/local/bin/gpg-agent --daemon --enable-ssh-support --write-env-file > /dev/null 2>&1
# if [ -r $GPG_AGENT_FILE ]; then
    # PID=`grep SSH_AGENT_PID $GPG_AGENT_FILE | cut -d= -f2 2>/dev/null`
    # `kill -0 $PID 2>/dev/null`
    # res=$?

    # if [ $res -eq 1 ]; then
        # /usr/local/bin/gpg-agent --daemon --enable-ssh-support --write-env-file > /dev/null 2>&1
        # PID=`grep SSH_AGENT_PID $GPG_AGENT_FILE | cut -d= -f2 2>/dev/null`
        # `kill -0 $PID 2>/dev/null`
        # res=$?
    # fi

    # if [ $res -eq 0 ]; then
        # source $GPG_AGENT_FILE
        # export GPG_AGENT_INFO
        # export SSH_AUTH_SOCK
        # export SSH_AGENT_PID
        # export GPG_TTY=`tty`
    # fi
# fi
