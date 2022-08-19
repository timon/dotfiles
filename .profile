export LANG="en_US.UTF-8"
alias ls='ls -kGF'
alias be='bundle exec'
alias gp="git push origin HEAD --follow-tags"
alias gpf="git push --force-with-lease origin HEAD"
alias gg="git pull --rebase"
alias gs="git status -sb"
alias gms="git merge-status"
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
export CDPATH=".:~:~/Sites:~/Sources"
if [ -e "/opt/homebrew/bin/brew" ]
then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ "`which brew`" ]
then
	if [ -f $(brew --prefix)/etc/bash_completion ]; then
		. $(brew --prefix)/etc/bash_completion
	elif [ -f $(brew --prefix)/etc/profile.d/bash_completion.sh ]; then
		. $(brew --prefix)/etc/profile.d/bash_completion.sh
	fi
fi

macos_devtools_prefix="/Library/Developer/CommandLineTools"
macos_git_comp="${macos_devtools_prefix}/usr/share/git-core/git-completion.bash"
[ -r "${macos_git_comp}" ] && source "${macos_git_comp}"

function current_ruby() {
  if [ "`which rbenv`" ]
  then
    version=$(rbenv version-name)
  else
    version="system (rbenv not set up)"
  fi
  echo -n "Ruby: ${version}"
}

function current_node() {
  if [ "`type -t nvm`" ]
  then
    version=$(nvm current)
  elif [ "`which node`" ]
  then
    version="system (nvm not set up)"
  else
    version="none"
  fi

  echo -n "Node: ${version}"
}

function current_branch() {
  git branch &>/dev/null || return
  echo -n " ($(git branch --show-current))"
}

ruby_node='$(current_ruby)\011$(current_node)'
lf='\012'
red='\033[01;31m\]'
green='\[\033[01;32m\]'
blue='\[\033[01;34m\]'
uncolor='\[\033[00m\]'
user_host_dir_branch="${green}\u@\h ${blue}\W${red}\$(current_branch)${uncolor}"
export PS1="${ruby_node}${lf}[${user_host_dir_branch}]\$ "

export COPYFILE_DISABLE
export COPY_EXTENDED_ATTRIBUTES_DISABLE
$(which rbenv >/dev/null 2>&1) && eval "$(rbenv init -)"
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

if [ -d "${HOME}/.gnupg" ] && [ -z "${SSH_AUTH_SOCK}" ]
then
	export SSH_AUTH_SOCK=$(gpgconf --list-dir agent-ssh-socket)
fi

if [ "$DISPLAY" ] && `which gvim 2>&1 >/dev/null`
then
	export VISUAL="gvim -f"
	export BUNDLER_EDITOR="gvim"
fi
