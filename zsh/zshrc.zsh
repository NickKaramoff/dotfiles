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

autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

### Completion ###
autoload -U promptinit
promptinit
zstyle ':completion:*' menu select=long-list select=0
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

source ~/.zsh_plugins.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



##     ##    ###    ########   ######  
##     ##   ## ##   ##     ## ##    ## 
##     ##  ##   ##  ##     ## ##       
##     ## ##     ## ########   ######  
 ##   ##  ######### ##   ##         ## 
  ## ##   ##     ## ##    ##  ##    ## 
   ###    ##     ## ##     ##  ######  

export DOTFILES="$HOME/.dotfiles"

export EDITOR='nano'  # sorry
export VEDITOR='code' # sorry not sorry

export GPG_TTY=$(tty) # fixes GPG
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES # fixes python multiprocessing



########     ###    ######## ##     ## 
##     ##   ## ##      ##    ##     ## 
##     ##  ##   ##     ##    ##     ## 
########  ##     ##    ##    ######### 
##        #########    ##    ##     ## 
##        ##     ##    ##    ##     ## 
##        ##     ##    ##    ##     ## 

export ANDROID_HOME="$HOME/dev/android-sdk"
export GOPATH="$HOME/go"

export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
export PATH="/usr/local/opt/ncurses/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/Cellar/node/13.13.0_1/bin:$PATH"




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
eval "$(pyenv init - zsh)"

### nvm ###
declare -a NODE_GLOBALS=("nvm")
load_nvm () {
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
}
nvm() {
  unset -f ${NODE_GLOBALS}
  load_nvm
  nvm $@
}

### jenv ###
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

### gcloud ###
export PATH="$HOME/google-cloud-sdk/bin:$PATH"
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi
