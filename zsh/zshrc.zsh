#!/usr/bin/env zsh
# Executes commands at the start of an interactive session.


# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

alias dps='docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Names}}"'

# create an .xz archive from directory
archive() {
  filename=$(basename $1)
  tar --create --xz --options='compression-level=9' --file "$filename.tar.xz" $1
}

# clone repos from github to ~/dev
clone() { 
  lwd=$(pwd)
  cd "$HOME/dev" || exit
  gh repo clone "$1"
  cd "$lwd" || exit
}

# open folder in dev folder
dev() { cd "$HOME/dev/$1" || exit ;}

# removes every dead/unused image/container
docker-deep-clean() {
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
dpsl() {
  clear;

  while true
  do
    docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Names}}";
    sleep 10;
    clear;
  done
}

# gitignore
gi() { curl -sLw "\n" "https://www.toptal.com/developers/gitignore/api/$@" ;}

eval "$(thefuck --alias)"
