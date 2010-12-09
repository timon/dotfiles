alias ls='ls -kGF'
alias gp="git push origin HEAD"
alias gg="git pull --rebase"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gac="git commit -a"

# MacPorts Installer addition on 2009-03-18_at_10:48:32: adding an appropriate PATH variable for use with MacPorts.
export PATH=$HOME/bin:/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


# MacPorts Installer addition on 2009-03-18_at_10:48:32: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH=/opt/local/share/man:$MANPATH
# Finished adapting your MANPATH environment variable for use with MacPorts.
export CDPATH=".:~:~/Sites:~/Sources"
    if [ -f /opt/local/etc/bash_completion ]; then
        . /opt/local/etc/bash_completion
    fi
export PS1='[\[\033[01;32m\]\u@\h\[\033[01;34m\] \W$(git branch &>/dev/null; if [ $? -eq 0 ]; then echo " \[\033[01;31m\]($(git branch | grep '^*' |sed s/\*\ //))"; fi)\[\033[00m\]]\$ '

if [ -f /opt/local/etc/bash_completion ]; then
	. /opt/local/etc/bash_completion
fi
export COPYFILE_DISABLE
export COPY_EXTENDED_ATTRIBUTES_DISABLE

