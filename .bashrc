# Colorize ls.
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Ignore duplicate commands in bash history.
export HISTCONTROL=ignoredups

# Add current git branch to shell command line.
__git_ps1 ()
{
local b="$(git symbolic-ref HEAD 2>/dev/null)";
if [ -n "$b" ]; then
printf " (%s)" "${b##refs/heads/}";
fi
}

PS1="\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u\[\033[01;34m\] \w\[\033[35m\]\$(__git_ps1) \[\033[01;34m\]\$\[\033[00m\] "

# git_push to curent branch
git_push ()
{
local b="$(git symbolic-ref HEAD 2>/dev/null)";
if [ -n "$b" ]; then
command="git push origin ${b##refs/heads/}";
printf "Executing: $command\n";
$command;
fi
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
