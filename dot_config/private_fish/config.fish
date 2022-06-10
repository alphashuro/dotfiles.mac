if status is-interactive
    set -x EDITOR nvim
    source (brew --prefix)/share/autojump/autojump.fish

    starship init fish | source

    set LIBRARY_PATH $LIBRARY_PATH (brew --prefix)/lib (brew --prefix)/opt/libiconv/lib
end

thefuck --alias | source
