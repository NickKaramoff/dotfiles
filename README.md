# dotfiles

My configuration files for various tools, CLIs and applications.

This repository also serves as an install guide for a fresh system so that I can
have the same environment everywhere.

## Pre-install

1. [`zsh`](http://www.zsh.org/)
1. [`antibody`](https://getantibody.github.io/)

## Install

```zsh
cd $HOME

git clone https://github.com/NickKaramoff/dotfiles.git .dotfiles

ln -s .dotfiles/zsh/zshrc.zsh .zshrc
ln -s .dotfiles/zsh/p10k.zsh .p10k.zsh
ln -s .dotfiles/zsh/zsh_plugins.txt .zsh_plugins.txt
antibody bundle < .zsh_plugins.txt > .zsh_plugins.sh
```
