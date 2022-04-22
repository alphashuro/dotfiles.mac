if status is-interactive
    set -x EDITOR nvim
    source /usr/local/share/autojump/autojump.fish

    starship init fish | source
end
