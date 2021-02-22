# dotfiles

My configuration files for various tools, CLIs and applications.

This repository also serves as an install guide for a fresh system so that I can
have the same environment everywhere.

## Prerequisities

Installation process of these tools is OS-dependent

1. [`zsh`](https://zsh.org/)

## Install

```zsh
cd $HOME

# install Prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# get dotfiles
git clone https://github.com/NickKaramoff/dotfiles.git .dotfiles

ln -s .dotfiles/zsh/zprofile.zsh .zprofile
ln -s .dotfiles/zsh/zpreztorc.zsh .zpreztorc
ln -s .dotfiles/zsh/zshenv.zsh .zshenv
ln -s .dotfiles/zsh/zshrc.zsh .zshrc
ln -s .dotfiles/zsh/zlogin.zsh .zlogin

ln -s .dotfiles/Brewfile .Brewfile
brew bundle --global --no-lock
```
