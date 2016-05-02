# Only configure if wrapper script exists
if (( ! $+commands[virtualenvwrapper.sh] )); then
  return 1
fi

# Set the directory where to place virtual environments
if [ "$WORKON_HOME" = "" ]; then
    export WORKON_HOME="$HOME/.virtualenvs"
fi

source "$commands[virtualenvwrapper.sh]"
