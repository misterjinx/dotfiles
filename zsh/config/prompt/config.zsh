# Load and init the prompt theme system
autoload -Uz promptinit && promptinit

# Set to have the prompt string subjected to parameter expansion, command substitution and arithmetic expansion
setopt PROMPT_SUBST

if [ "$PROMPT_THEME" = "" ]; then
    PROMPT_THEME='default'
fi

# Load helper functions for prompt
source "${0:h}/functions/git.zsh"

# Load selected prompt theme
source "${0:h}/themes/$PROMPT_THEME"
