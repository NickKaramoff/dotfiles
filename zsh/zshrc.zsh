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

colormap() {
  i=0
  while [ $i -le 255 ]
  do
    print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+"
"}
    i=$(( i+1 ))
  done
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
gi() {
  curl -sLw "\n" "https://www.toptal.com/developers/gitignore/api/$@"
}

# lighthouse
lh() {
  npm exec --yes -- lighthouse "$@" --chrome-flags="--headless" --output-path="/tmp/lighthouse-results.html" --view
}

# scc with sensible config
sccc() {
  scc --no-cocomo -c --no-min-gen "$@"
}

eval "$(thefuck --alias)"

# rate-arch-mirrors
ua_drop_caches() {
  sudo paccache -rk3
  yay -Sc --aur --noconfirm
}

ua_update_all() {
  TMPFILE="$(mktemp)"
  sudo true
  rate-arch-mirrors --max-delay=21600 | tee -a "$TMPFILE" \
    && sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup \
    && sudo mv "$TMPFILE" /etc/pacman.d/mirrorlist \
    && ua_drop_caches \
    && yay -Syyu --noconfirm 
}

