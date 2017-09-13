export LANG="en_US.UTF-8"
alias ls='ls -kGF'
alias be='bundle exec'
alias gp="git push origin HEAD"
alias gpf="git push -f origin HEAD"
alias gg="git pull --rebase"
alias gs="git status --short"
alias ga="git add"
alias gc="git commit"
alias gac="git commit -a"
if [ -d /Applications/MacVim.app ]; then
	alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
	alias vi='/Applications/MacVim.app/Contents/MacOS/Vim'
fi

# Now using brew
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"

export MANPATH=/usr/local/share/man:$MANPATH
export CDPATH=".:~:~/Sites:~/Sources"
if [ "`which brew`" ]
then
	prefix=$(brew --prefix)
fi

if [ -f ${prefix}/etc/bash_completion ]; then
	. ${prefix}/etc/bash_completion
fi
export PS1='Ruby: $(rbenv version-name)\012[\[\033[01;32m\]\u@\h\[\033[01;34m\] \W$(git branch &>/dev/null; if [ $? -eq 0 ]; then echo " \[\033[01;31m\]($(git branch | grep '^*' |sed s/\*\ //))"; fi)\[\033[00m\]]\$ '

export COPYFILE_DISABLE
export COPY_EXTENDED_ATTRIBUTES_DISABLE
eval "$(rbenv init -)"
shopt -s histappend
export LC_CTYPE=en_US.UTF-8
export PYTHONIOENCODING=UTF-8
export EDITOR=vim
