# dotfiles

My configuration files for various tools, CLIs and applications.

This repository also serves as an install guide for a fresh [Arch]-based
Raspberry Pi so that I can have the same environment everywhere.

## Prerequisities

Installation process of these tools is OS-dependent

1. [`zsh`](https://zsh.org/)

## Install

```zsh
# install sudo
su -
pacman -S sudo
⌃D

# install yay
cd /opt
sudo pacman -S --needed git base-devel
sudo git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# install dependencies
yay -S --needed aria2c curl git less nano sudo thefuck zsh

cd $HOME

# get dotfiles
git clone https://github.com/NickKaramoff/dotfiles.git .dotfiles

# install Prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
cd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)"
ln -s $HOME/.dotfiles/tool-versions $HOME/.tool-versions

cd $HOME

# prezto setup
ln -s $HOME/.dotfiles/zsh/zprofile.zsh $HOME/.zprofile
ln -s $HOME/.dotfiles/zsh/p10k.zsh $HOME/.p10k.zsh
ln -s $HOME/.dotfiles/zsh/zpreztorc.zsh $HOME/.zpreztorc
ln -s $HOME/.dotfiles/zsh/zshenv.zsh $HOME/.zshenv
ln -s $HOME/.dotfiles/zsh/zshrc.zsh $HOME/.zshrc
ln -s $HOME/.dotfiles/zsh/zlogin.zsh $HOME/.zlogin
ln -s $HOME/.dotfiles/zprezto-contrib $HOME/.zprezto-contrib

# git setup
ln -s $HOME/.dotfiles/git/gitconfig $HOME/.gitconfig
ln -s $HOME/.dotfiles/git/gitignore_global $HOME/.gitignore_global

# aria2c setup
mkdir -p $XDG_CONFIG_HOME/aria2/
ln -s $HOME/.dotfiles/aria2.conf $XDG_CONFIG_HOME/aria2/aria2.conf
```

[Arch]: https://archlinuxarm.org/
