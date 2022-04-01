alias vim="nvim"
alias ls="exa"
alias config='/usr/bin/git --git-dir=/home/tsspidermine/.dotfiles --work-tree=/home/tsspidermine'

# source /home/tsspidermine/.bin/openproj

bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

eval "$(starship init zsh)"
