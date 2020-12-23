
# Language specific options

# Align with spaces
hook global WinCreate .* %{
    set-option window aligntab false
}

# C/Cpp
hook global WinSetOption filetype=(c|cpp) %{
    set-option window formatcmd 'clang-format'
}

# Rust
hook global WinSetOption filetype=rust %{
    set window formatcmd 'rustfmt'
}

# Makefile
hook global BufCreate .*\.mk$ %{
    set-option buffer filetype makefile
}

# Kakscript
hook global WinSetOption filetype=kak %{
    hook global NormalIdle .* %{ try %{
        execute-keys -draft -save-regs '' <a-i>w"ay
        echo -markup "{rgb:%reg{a}}██"
    }}
}

# Assembly
hook global WinSetOption filetype=gas %{
    remove-highlighter window/whitespace
    set-option window comment_line '#'
}

# Extra Highlightings
## sh
add-highlighter shared/sh/perl region "perl [^']*'" "'" ref perl/code

