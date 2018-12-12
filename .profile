export LANG="en_US.UTF-8"
alias ls='ls -kGF'
alias be='bundle exec'
alias gp="git push origin HEAD"
alias gpf="git push -f origin HEAD"
alias gg="git pull --rebase"
alias gs="git status -sb"
alias ga="git add"
alias gc="git commit"
alias gac="git commit -a"
alias grep="$(which grep) --color=auto -E"
alias ngrep="grep -n"
alias duh='du -hd1 | gsort -h'
if [ -d /Applications/MacVim.app ]; then
	alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
	alias vi='/Applications/MacVim.app/Contents/MacOS/Vim'
fi

# Now using brew
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"

export MANPATH=/usr/local/share/man:$MANPATH
export CDPATH=".:./organizers/:~:~/Sources"

export COPYFILE_DISABLE
export COPY_EXTENDED_ATTRIBUTES_DISABLE
eval "$(rbenv init -)"
shopt -s histappend
export LC_CTYPE=en_US.UTF-8
export PYTHONIOENCODING=UTF-8
export EDITOR=vim

export NVM_DIR=~/.nvm
export NVM_DIR="${HOME}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

if [ -d ${HOME}/perl5 ]
then
	export PATH="${HOME}/perl5/bin${PATH:+:${PATH}}"
	export PERL5LIB="${HOME}/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
	export PERL_LOCAL_LIB_ROOT="${HOME}/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
	export PERL_MB_OPT="--install_base \"${HOME}/perl5\""
	export PERL_MM_OPT="INSTALL_BASE=${HOME}/perl5"
fi
