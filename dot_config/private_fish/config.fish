if status is-interactive
    set -x EDITOR nvim
    source /opt/homebrew/share/autojump/autojump.fish

    starship init fish | source
end
