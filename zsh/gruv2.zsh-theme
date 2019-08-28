# foreground color
FG_COLOR_BASE03=%F{#bdae93}
FG_COLOR_BASE02=%F{0}
FG_COLOR_BASE01=%F{4}
FG_COLOR_BASE00=%F{11}
FG_COLOR_BASE0=%F{12}
FG_COLOR_BASE1=%F{14}
FG_COLOR_BASE2=%F{7}
FG_COLOR_BASE3=%F{15}
FG_COLOR_YELLOW=%F{#fabd2f}
FG_COLOR_ORANGE=%F{#fe8019}
FG_COLOR_RED=%F{#fb4034}
FG_COLOR_MAGENTA=%F{#b16286}
FG_COLOR_VIOLET=%F{#d3869b}
FG_COLOR_BLUE=%F{#83a598}
FG_COLOR_CYAN=%F{#8ec07c}
FG_COLOR_GREEN=%F{#b8bb26}

FG_COLOR_FG0=%F{#fbf1c7}
FG_COLOR_GRAY=%F{#928374}


ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG_COLOR_CYAN%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG_COLOR_RED%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG_COLOR_GREEN%}✔"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$FG_COLOR_RED%}➦"

ZSH_THEME_GIT_PROMPT_ADDED="%{$FG_COLOR_CYAN%} ✈"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG_COLOR_YELLOW%} ✭"
ZSH_THEME_GIT_PROMPT_DELETED="%{$FG_COLOR_RED%} ✗"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$FG_COLOR_BLUE%} ➦"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$FG_COLOR_MAGENTA%} ✂"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FG_COLOR_GRAY%} ✱"

function prompt_char {
    if [ $UID -eq 0 ];
    then
        echo "%{$FG_COLOR_RED%}♛%{$reset_color%}";
    else
        echo "%{$FG_COLOR_BASE03%}🞄🞄🞄🞂%{$reset_color%}";

    fi
}


# get the name of the branch we are on
function vim_bg_info() {
    if [[ "$(command echo $VIM)" != "" ]]; then
        echo " ⚡"
    fi
}

PROMPT='%(?, ,%{$FG_COLOR_RED%}FAIL%{$reset_color%}
        )
%{$FG_COLOR_GREEN%}[%*]%{$reset_color%} %{$FG_COLOR_YELLOW%}%~%{$reset_color%}$(git_prompt_info)%{$reset_color%}$(git_prompt_ahead)%{$reset_color%}$(vim_bg_info)
%_$(prompt_char) '

# Time on right
#RPROMPT='%{$fg[green]%}[%*]%{$reset_color%}'
