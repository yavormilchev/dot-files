# Add `~/bin` to the `$PATH` to make composer globally accessible.
export PATH="$HOME/bin:$PATH"

# Add ~/.composer/vendor/bin to the `$PATH` to make composer vendor packages globally accessible (e.g. Lumen installer).
export PATH="$HOME/.composer/vendor/bin:$PATH"

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

alias gitranks='git shortlog -s -n'
alias undocommit='git reset HEAD~'

# Use PHP with xdebug disabled
pnx () {
    temporaryPath="$(mktemp -t php.XXXX).ini"

    # Using awk to ensure that files ending without newlines do not lead to configuration error
    php -i | grep "\.ini" | grep -o -e '\(/[a-z0-9._-]\+\)\+\.ini' | grep -v xdebug | xargs awk 'FNR==1{print ""}1' | grep -v xdebug > "$temporaryPath"

    php -n -c "$temporaryPath" "$@"
    rm -f "$temporaryPath"
}
