. /etc/profile
. ~/.profile

function prompt() {
	local red="\[\033[01;31m\]"
	local green="\[\033[01;32m\]"
	local blue="\[\033[01;34m\]"
	local norm="\[\033[00m\]"

	local ruby='Ruby: $(rbenv version-name)'
	local branch='$(__git_ps1 2>/dev/null)'

	echo "${ruby}\012[${green}\\u@\\h ${blue}\\W${red}${branch}${norm}]\\\$ "
}

export PS1="$(prompt)"

if [ "`which brew`" ]
then
	prefix=$(brew --prefix)
fi

if [ -n "$BASH" ] && [ -f ${prefix}/etc/bash_completion ]; then
	. ${prefix}/etc/bash_completion
fi

if [ "`which direnv`" ]
then
	eval $(direnv hook bash)
fi
