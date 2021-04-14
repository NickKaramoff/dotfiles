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

# prezto setup
ln -s $HOME/.dotfiles/zsh/zprofile.zsh $HOME/.zprofile
ln -s $HOME/.dotfiles/zsh/p10k.zsh $HOME/.p10k.zsh
ln -s $HOME/.dotfiles/zsh/zpreztorc.zsh $HOME/.zpreztorc
ln -s $HOME/.dotfiles/zsh/zshenv.zsh $HOME/.zshenv
ln -s $HOME/.dotfiles/zsh/zshrc.zsh $HOME/.zshrc
ln -s $HOME/.dotfiles/zsh/zlogin.zsh $HOME/.zlogin
ln -s $HOME/.dotfiles/zprezto-contrib $HOME/.zprezto-contrib

# homebrew setup & package install
ln -s $HOME/.dotfiles/Brewfile .Brewfile
brew bundle --global --no-lock

# git setup
ln -s $HOME/.dotfiles/git/gitconfig $HOME/.gitconfig
ln -s $HOME/.dotfiles/git/gitignore_global $HOME/.gitignore_global

# vscode setup
ln -s $HOME/.dotfiles/vscode/settings.json "$HOME/Library/Application Support/Code/User/settings.json"
```
