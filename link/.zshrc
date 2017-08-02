# Check if zplug is installed
if [[ ! -f ~/.zsh/antigen/antigen.zsh ]]; then
    mkdir -p ~/.zsh/antigen
    curl https://cdn.rawgit.com/zsh-users/antigen/v1.2.1/bin/antigen.zsh > ~/.zsh/antigen/antigen.zsh
fi
source ~/.zsh/antigen/antigen.zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git

# Syntax highlighting bundle.
    antigen bundle zsh-users/zsh-syntax-highlighting
    antigen bundle zsh-users/zsh-completions
    antigen bundle zsh-users/zsh-history-substring-search
    antigen bundle ~/.dotfiles/source
    antigen bundle https://github.com/tj/git-extras.git etc/git-extras-completion.zsh
    antigen-bundle Tarrasch/zsh-autoenv

# Load the theme.
# antigen theme tylerreckart/odin odin.zsh-theme
antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship


# Tell antigen that you're done.
antigen apply
#####################################################################
# environment
#####################################################################

export EDITOR=vim
export LANG=pt_BR.UTF-8
export SPACESHIP_PACKAGE_SHOW=false

#####################################################################
# completions
#####################################################################

# Enable completions
if [ -d ~/.zsh/comp ]; then
    fpath=(~/.zsh/comp $fpath)
    autoload -U ~/.zsh/comp/*(:t)
fi

zstyle ':completion:*' group-name ''
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:descriptions' format '%d'
zstyle ':completion:*:options' verbose yes
zstyle ':completion:*:values' verbose yes
zstyle ':completion:*:options' prefix-needed yes
# Use cache completion
# apt-get, dpkg (Debian), rpm (Redhat), urpmi (Mandrake), perl -M,
# bogofilter (zsh 4.2.1 >=), fink, mac_apps...
zstyle ':completion:*' use-cache true
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list \
    '' \
    'm:{a-z}={A-Z}' \
    'l:|=* r:|[.,_-]=* r:|=* m:{a-z}={A-Z}'
# sudo completions
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
    /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
zstyle ':completion:*' menu select
zstyle ':completion:*' keep-prefix
zstyle ':completion:*' completer _oldlist _complete _match _ignored \
    _approximate _list _history

autoload -U compinit; compinit -d ~/.zcompdump

# Original complete functions
compdef '_files -g "*.hs"' runhaskell
compdef _man w3mman
compdef _tex platex

# cd search path
cdpath=($HOME)

zstyle ':completion:*:processes' command "ps -u $USER -o pid,stat,%cpu,%mem,cputime,command"

#####################################################################
# colors
#####################################################################

if [ $TERM = "dumb" ]; then
    # Disable colors in GVim
    alias ls="ls -F --show-control-chars"
    alias la='ls -aF --show-control-chars'
    alias ll='ls -lF --show-control-chars'
    alias l.='ls -dF .[a-zA-Z]*'
else
    # Color settings for zsh complete candidates
    alias ls='ls -F --show-control-chars --color=always'
    alias la='ls -aF --show-control-chars --color=always'
    alias ll='ls -lF --show-control-chars --color=always'
    alias l.='ls -dF .[a-zA-Z]* --color=always'
    export LSCOLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
fi

# use prompt colors feature
autoload -U colors
colors

#####################################################################
# alias
######################################################################
alias music="mpsyt"
alias zshconfig="vim ~/.zshrc"

#####################################################################
# functions
######################################################################

# Set environment variables easily
setenv () { export $1="$@[2,-1]" }

#-------------------------------------------------------
# Print all histories
function history-all { history -E 1 }

#####################################################################
# others
######################################################################

# Improve terminal title
case "${TERM}" in
    kterm*|xterm*|vt100)
        precmd() {
            echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
        }
        ;;
esac

# Share zsh histories
HISTFILE=$HOME/.zsh-history
HISTSIZE=10000
SAVEHIST=10000
setopt inc_append_history
setopt share_history

autoload -U +X bashcompinit && bashcompinit
complete -C /home/dev/.go/bin/gocomplete go
