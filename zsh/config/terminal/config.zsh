# Only configure if a proper terminal is used
if [[ "$TERM" == (dumb|linux|*bsd*|eterm*) ]]; then
    return 1
fi

# Modified version of the original functions from:
# http://grml.org/zsh/zsh-lovers.html

function title {
    emulate -L zsh

    if [[ $TERM == "screen" ]]; then
        # Set hardstatus for GNU Screen:
        print -Pn "\ek$1:q\e\\"
    fi

    # Use this one instead for XTerms:
    print -Pn "\e]0;$1\a"    
}

function precmd_hook {
    emulate -L zsh
   
    title "%n@%m: %~"
}

function preexec_hook {
    emulate -L zsh
    
    local -a cmd; cmd=(${(z)1})
    title $cmd[1]:t "$cmd[2,-1]"
}

# Load hook
autoload -Uz add-zsh-hook

# Add hooks
add-zsh-hook precmd precmd_hook
add-zsh-hook preexec preexec_hook
