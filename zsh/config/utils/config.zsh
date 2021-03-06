# Enable color support for ls, grep & Co.
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -N --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# List aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# General aliases
alias rot13="tr 'A-Za-z' 'N-ZA-Mn-za-m'" # rot13 encoding

