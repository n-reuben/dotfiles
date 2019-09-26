# Setup fzf
# ---------
if [[ ! "$PATH" == */home/nitish/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/nitish/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/nitish/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/nitish/.fzf/shell/key-bindings.zsh"
