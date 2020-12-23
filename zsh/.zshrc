# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nitish/.zshrc'

autoload -Uz compinit
compinit

# End of lines added by compinstall


export VISUAL="kak"
export EDITOR="kak"
export LC_CTYPE=en_US.UTF-8
bindkey -e

#Android Studio and such
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

#darn npm permissions
export PATH=~/.npm-global/bin:$PATH

#Custom scripts
export PATH=$PATH:"$HOME/bin"
export PATH=$PATH:"$HOME/compilers/bin"
export PATH=$PATH:"$HOME/.local/bin"

#Laravel Spark
export PATH=$PATH:"$HOME/.config/composer/vendor/bin"
export PATH=$PATH:"$HOME/Downloads/spark-installer"

#helpfulness
alias rm="rm -i"
alias cp="cp -r"

# misspellings
alias sduo=sudo
alias sdudo=sudo
alias sudi=sudo
alias clea=clear
alias ncim=nvim
alias nivm=nvim
alias vnim=nvim
alias nvmi=nvim
alias ezec="exec"
alias sl="ls"
alias s="ls"
alias ks="ls"
alias lss="ls"
alias sls="ls"
alias ls-a="ls -a"
alias scd=cd
alias "cd.."="cd .."
alias mdkir=mkdir
alias ,,=..

autoload -U promptinit; promptinit
prompt pure

#export PATH="$HOME/bin:$PATH"
export PATH="$HOME/dotfiles/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"
