# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

DEFAULT_USER="nick"

HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt HIST_REDUCE_BLANKS

### Completion ###
fpath+=~/.zfunc
autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

autoload -U promptinit
promptinit
zstyle ':completion:*' menu select=long-list select=0
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

[[ ! -f ~/.zsh_plugins.sh ]] || source ~/.zsh_plugins.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



##     ##    ###    ########   ######  
##     ##   ## ##   ##     ## ##    ## 
##     ##  ##   ##  ##     ## ##       
##     ## ##     ## ########   ######  
 ##   ##  ######### ##   ##         ## 
  ## ##   ##     ## ##    ##  ##    ## 
   ###    ##     ## ##     ##  ######  

export DOTFILES="$HOME/.dotfiles"

export VISUAL="nano"
export EDITOR="nano"


export GPG_TTY=$(tty) # fixes GPG
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES # fixes python multiprocessing on macOS



########     ###    ######## ##     ## 
##     ##   ## ##      ##    ##     ## 
##     ##  ##   ##     ##    ##     ## 
########  ##     ##    ##    ######### 
##        #########    ##    ##     ## 
##        ##     ##    ##    ##     ## 
##        ##     ##    ##    ##     ## 

export ANDROID_HOME="$HOME/dev/android-sdk"

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"

export PATH="/usr/local/opt/ncurses/bin:$PATH" # fixes nvm

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export PATH="/usr/local/sbin:$PATH"

export PATH="/Users/nick/.local/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"

# export PATH="$HOME/.poetry/bin:$PATH"




   ###    ##       ####    ###     ######  ########  ######  
  ## ##   ##        ##    ## ##   ##    ## ##       ##    ## 
 ##   ##  ##        ##   ##   ##  ##       ##       ##       
##     ## ##        ##  ##     ##  ######  ######    ######  
######### ##        ##  #########       ## ##             ## 
##     ## ##        ##  ##     ## ##    ## ##       ##    ## 
##     ## ######## #### ##     ##  ######  ########  ######  
alias ..='cd ..'

alias doc='docker'
alias doco='docker-compose'
alias dps='docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Names}}"'

alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

alias md='mkdir -p'
alias rd='rmdir'

alias o='open'
alias ow='open -a'

alias sudoedit='sudo $EDITOR'  # sudoedit (for sudo plugin)



######## ##     ## ##    ##  ######  ######## ####  #######  ##    ##  ######  
##       ##     ## ###   ## ##    ##    ##     ##  ##     ## ###   ## ##    ## 
##       ##     ## ####  ## ##          ##     ##  ##     ## ####  ## ##       
######   ##     ## ## ## ## ##          ##     ##  ##     ## ## ## ##  ######  
##       ##     ## ##  #### ##          ##     ##  ##     ## ##  ####       ## 
##       ##     ## ##   ### ##    ##    ##     ##  ##     ## ##   ### ##    ## 
##        #######  ##    ##  ######     ##    ####  #######  ##    ##  ######  

# gitignore
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
# clone repos from github to ~/dev
clone() { 
  lwd=$(pwd)
  cd "$HOME/dev" || exit
  gh repo clone "$1"
  cd "$lwd" || exit
}


# removes every dead/unused image/container
function docker_deep_clean() {
    echo "Removing exited containers..."
    echo "============================="
    docker ps --filter status=dead --filter status=exited -aq | xargs docker rm -v
    echo ""
    echo "Removing unused images..."
    echo "========================="
    docker images --no-trunc | grep '<none>' | awk '{ print $3 }' | xargs docker rmi
    echo ""
    echo "Removing unused volumes..."
    echo "=========================="
    docker volume ls -qf dangling=true | xargs docker volume rm
    echo ""
    echo "Done."
}

# docker ps with live update
function dpsl() {
  clear;

  while true
  do
    docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Names}}";
    sleep 10;
    clear;
  done
}




########  #######   #######  ##        ######  
   ##    ##     ## ##     ## ##       ##    ## 
   ##    ##     ## ##     ## ##       ##       
   ##    ##     ## ##     ## ##        ######  
   ##    ##     ## ##     ## ##             ## 
   ##    ##     ## ##     ## ##       ##    ## 
   ##     #######   #######  ########  ######  

### pyenv ###
if type pyenv &>/dev/null; then
  eval "$(pyenv init - zsh)"
fi

## nvm ###
load_nvm () {
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
}
nvm() {
  load_nvm
  nvm $@
}

### gcloud: completions ###
export PATH="$HOME/google-cloud-sdk/bin:$PATH"
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

### gh: completions ###
eval "$(gh completion -s zsh)"
