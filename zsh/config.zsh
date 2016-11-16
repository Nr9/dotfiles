# if [[ -n $SSH_CONNECTION ]]; then
#   export PS1='%m:%3~$(git_info_for_prompt)%# '
# else
#   export PS1='%3~$(git_info_for_prompt)%# '
# fi

#export LSCOLORS="exfxcxdxbxegedabagacad"
#export CLICOLOR=true

fpath=($DOTFILES/functions $fpath)

autoload -U $DOTFILES/functions/*(:t)

# setopt NO_BG_NICE # don't nice background tasks
# setopt NO_HUP
# setopt LOCAL_OPTIONS # allow functions to have local options
# setopt LOCAL_TRAPS # allow functions to have local traps
# setopt PROMPT_SUBST
# setopt IGNORE_EOF

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
# setopt complete_aliases

zle -N newtab

bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[^N' newtab
bindkey '^?' backward-delete-char
