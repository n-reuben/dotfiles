## User preference
## ───────────────
#
#set-option global makecmd 'make -j8'
#set-option global grepcmd 'ag --column'
#set-option global clang_options -std=c++1y
#set-option global ui_options ncurses_status_on_top=true
set global ui_options ncurses_assistant=none
#
colorscheme default
#
#hook global WinSetOption filetype=(c|cpp) %{
#    clang-enable-autocomplete 
#    clang-enable-diagnostics
#    alias window lint clang-parse
#    alias window lint-next-error clang-diagnostics-next
#}
#
#hook global WinSetOption filetype=python %{
#    jedi-enable-autocomplete
#    lint-enable
#    set-option global lintcmd 'flake8'
#}

evaluate-commands %sh{ [ -f $kak_config/local.kak ] && echo "source $kak_config/local.kak" }

#Global clipboard config

map global user y '<a-|>xclip -i -selection clipboard<ret>'
map global user p '!xclip -o -selection clipboard<ret>'


# highlighters
add-highlighter global/ number-lines
add-highlighter global/ show-matching
add-highlighter global/ show-whitespaces
#add-highlighter global/ dynregex '%reg{/}' 0:+u
#


#
# global options

set global ui_options ncurses_assistant=off

# if not configured per file type, set tabs as 4 spaces
set global tabstop 4

# insert 4 spaces on tab key
hook global InsertChar \t %{ exec -draft -itersel h@ } -group kakrc-replace-tabs-with-spaces
