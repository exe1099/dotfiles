#  ______     ______     __  __     ______     ______
# /\___  \   /\  ___\   /\ \_\ \   /\  == \   /\  ___\
# \/_/  /__  \ \___  \  \ \  __ \  \ \  __<   \ \ \____
#   /\_____\  \/\_____\  \ \_\ \_\  \ \_\ \_\  \ \_____\
#   \/_____/   \/_____/   \/_/\/_/   \/_/ /_/   \/_____/
#

# zmodload zsh/zprof  # for timings of startup, also a command at end of file
# oh-my-zsh -------------------------------------------------------------------------{{{

# path to your oh-my-zsh installation
export ZSH="/home/exe/.oh-my-zsh"
ZSH_THEME="eastwood"
plugins=(   git
            colored-man-pages
            sudo)
source $ZSH/oh-my-zsh.sh

# }}}
# Basic options ---------------------------------------------------------------------{{{

# auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)  # include hidden files

# enable colors
autoload -U colors && colors

# history in cache directory
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# }}}
# vim -------------------------------------------------------------------------------{{{

# use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

 # }}}
# lf --------------------------------------------------------------------------------{{{

# use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# }}}
# Anaconda --------------------------------------------------------------------------{{{

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/exe/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/exe/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/exe/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/exe/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# }}}
# zprof
