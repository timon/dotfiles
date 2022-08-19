. /etc/profile
. ~/.profile

if [ "`which brew`" ]
then
	prefix=$(brew --prefix)
fi

if [ -n "$BASH" ] && [ -f ${prefix}/etc/bash_completion ]; then
	. ${prefix}/etc/bash_completion
fi

export HISTCONTROL=ignoreboth:erasedups
# PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

PATH="/Users/artemignatyev/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/artemignatyev/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/artemignatyev/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/artemignatyev/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/artemignatyev/perl5"; export PERL_MM_OPT;
