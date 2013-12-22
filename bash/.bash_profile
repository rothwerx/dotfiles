# .bash_profile is executed every time in OS X (all sessions are login sessions)
# and executed for login sessions on Linux
if [ -z "$PS1" ]; then
   return
fi

#PS1='\h:\W \u\$ '
export PS1="\[\033[01;31m\][\t]\[\033[00m\] \[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$ "
# Make bash check its window size after a process completes
shopt -s checkwinsize

export CLICOLOR=1
. ~/.aliases

if [ -f .bash_profile.local ]; then
    . .bash_profile.local
fi
