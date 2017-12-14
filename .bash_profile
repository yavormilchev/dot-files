# Add `~/bin` to the `$PATH` to make composer globally accessible.
export PATH="$HOME/bin:$PATH"

# Add ~/.composer/vendor/bin to the `$PATH` to make composer vendor packages globally accessible (e.g. Lumen installer).
export PATH="$HOME/.composer/vendor/bin:$PATH"

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

alias gitranks='git shortlog -s -n'
alias undocommit='git reset HEAD~'
