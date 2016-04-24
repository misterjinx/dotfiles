# Config

HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"   # Path to the history file
HISTSIZE=10000                              # Maximum number of events to save in the internal history
SAVEHIST=10000                              # Maximum number of events to save in the history file


# Options

setopt APPEND_HISTORY           # Allow multiple terminal sessions to append to one zsh history file
setopt INC_APPEND_HISTORY       # Write to the history file immediately, not when the shell exits
setopt EXTENDED_HISTORY         # Include timestamps to the history file in the format %<start time%>:%<end time%>:%<command%>
setopt HIST_EXPIRE_DUPS_FIRST   # Expire a duplicate event first when trimming history
setopt HIST_IGNORE_DUPS         # Do not save command lines to history if they are duplicates of previous events
setopt HIST_IGNORE_ALL_DUPS     # Delete an old recorded event if a new event is a duplicate
setopt HIST_FIND_NO_DUPS        # Do not display a previously found event
setopt HIST_SAVE_NO_DUPS        # Do not write a duplicate event to the history file
setopt HIST_IGNORE_SPACE        # Do not save events starting with a space
setopt HIST_VERIFY              # When the user enters a line containing a history substitution, don't execute the line immediately.
                                # Instead, perform history substitution and reload the line into the editing buffer
setopt SHARE_HISTORY            # Share history between all sessions


# Aliases

# Lists the ten most used commands
alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"
