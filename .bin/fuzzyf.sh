#!/bin/env zsh
# $(compgen -c | sort -u | fzf --color=bw --reverse --border --cycle)
print -rl -- ${(ko)commands} | fzf --reverse --color=border:#3fc997,bg+:#36323d,bg:#0f0c14,pointer:#3fc997 --border --cycle | (nohup sh &) >/dev/null 2>&1
