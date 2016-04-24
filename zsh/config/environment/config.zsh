# Smart URLs

autoload -Uz url-quote-magic bracketed-paste-magic
zle -N self-insert url-quote-magic              # When inserting URLs 
zle -N bracketed-paste bracketed-paste-magic    # And when pasting them
