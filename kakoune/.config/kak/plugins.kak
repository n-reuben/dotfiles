# Install kak plugs

evaluate-commands %sh{
    # kak plugin directory
    PLUGIN_DIRECTORY="$HOME/.plugins/kak/plugins"
    KAK_PLUG="$PLUGIN_DIRECTORY/plug.kak/rc/plug.kak"

    # if does not exist, create it and git clone kak plug
    if [ -f $KAK_PLUG ]; then
        echo source $KAK_PLUG
    else
        mkdir -p $PLUGIN_DIRECTORY
        echo echo "installing plugins..."
        git clone "https://github.com/andreyorst/plug.kak" "$PLUGIN_DIRECTORY/plug.kak" > /dev/null 
        GIT_RET_CODE=$?
        if [ "$GIT_RET_CODE" -eq "0" ]; then
            echo echo "kak.plug installed successfully"
            echo source $KAK_PLUG
        else
            echo echo "failed to install kak.plug"
        fi
    fi
}

# Plugin installation directory
set-option global plug_install_dir %sh{ echo $HOME/.plugins/kak/plugins }

# Plugins
#Plugin Manager
plug "https://github.com/andreyorst/plug.kak" noload

#Kakoune Language Server Protocol
plug "ul/kak-lsp" do %{
    cargo build --release --locked
    cargo install --force --path .
} config %{
    set-option global lsp_completion_trigger "execute-keys 'h<a-h><a-k>\S[^\h\n,=;*(){}\[\]]\z<ret>'"
    set-option global lsp_diagnostic_line_error_sign "!"
    set-option global lsp_diagnostic_line_warning_sign "?"
    hook global WinSetOption filetype=(c|cpp|rust) %{
        map window user "l" ": enter-user-mode lsp<ret>" -docstring "LSP mode"
        lsp-enable-window
        lsp-auto-hover-enable
        lsp-auto-hover-insert-mode-disable
        set-option window lsp_hover_anchor true
        set-face window DiagnosticError default+u
        set-face window DiagnosticWarning default+u
    }
    hook global WinSetOption filetype=rust %{
        set-option window lsp_server_configuration rust.clippy_preference="on"
    }
    hook global KakEnd .* lsp-exit
}

#fzf tool for kakoune
#plug "andreyorst/fzf.kak" %{
#    map -docstring 'fzf mode' global normal '<c-p>' ': fzf-mode<ret>'
#    set-option global fzf_preview_width '65%'
#    evaluate-commands %sh{
#        if [ -n "$(command -v fd)" ]; then
#            echo "set-option global fzf_file_command %{fd . --no-ignore --type f --follow --hidden --exclude .git --exclude .svn}"
#        else
#            echo "set-option global fzf_file_command %{find . \( -path '*/.svn*' -o -path '*/.git*' \) -prune -o -type f -follow -print}"
#        fi
#        [ -n "$(command -v bat)" ] && echo "set-option global fzf_highlighter bat"
#        [ -n "$(command -v rg)" ] && echo "set-option global fzf_sk_grep_command %{$kak_opt_grepcmd}"
#    }
#}

#Auto-pairs for brackets
plug "alexherbo2/auto-pairs.kak" %{
    map global user 's' ': auto-pairs-surround<ret>' -docstring "surround selection"
}

#Enable auto-pairs on load

hook global WinCreate .* %{
  auto-pairs-enable
}

#tagbar to give you an outline of your program
plug "andreyorst/tagbar.kak" defer "tagbar" %{
    set-option global tagbar_sort false
    set-option global tagbar_size 40
    set-option global tagbar_display_anon false
} config %{
    # if you have wrap highlighter enamled in you configuration
    # files it's better to turn it off for tagbar, using this hook:
    hook global WinSetOption filetype=tagbar %{
        remove-highlighter window/wrap
        # you can also disable rendering whitespaces here, line numbers, and
        # matching characters
    }
}

#Hook for tagbar toggle
## To see what filetypes are supported use `ctags --list-kinds | awk '/^\w+/'
#hook global WinSetOption filetype=(c|cpp|rust) %{
#    tagbar-enable
#}

#map global user  ': make-next-error<ret>'



#To quit tagbar client on q
alias global 'q' 'tagbar-quit'
alias global 'wq' 'tagbar-write-quit'
