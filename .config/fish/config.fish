if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Disable the fish greeting
set -U fish_greeting

set EDITOR nvim

# Enable starship for fish
starship init fish | source
