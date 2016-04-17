if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# prompt format
PROMPT='%{$fg_bold[$NCOLOR]%}%n@%m\
%{$reset_color%}%{$fg_bold[blue]%} %~\
$(git_prompt_info)$(git_prompt_status) \
%{$fg_bold[blue]%}%(!.#.$)%{$reset_color%} '
RPS1='${return_code}'
 
# git_prompt_info() format
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[magenta]%}("
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✖︎%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[magenta]%})%{$reset_color%}"
 
# git_promp_status() format
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[cyan]%}(!)%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg_bold[yello]%}(!)%{$reset_color%}"