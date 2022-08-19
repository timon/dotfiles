. /etc/profile
. ~/.profile

if [ "`which brew`" ]
then
	prefix=$(brew --prefix)
fi

if [ -n "$BASH" ] && [ -f ${prefix}/etc/bash_completion ]; then
	. ${prefix}/etc/bash_completion
fi

if [ "`which direnv`" ]
then
	eval "$(direnv hook bash)"
fi

export HISTCONTROL=ignoreboth:erasedups
# PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"
