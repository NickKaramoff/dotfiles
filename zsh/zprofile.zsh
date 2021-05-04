#!/usr/bin/env zsh
# Executes commands at login pre-zshrc.


# Browser
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi


# Editors
export EDITOR='nano'
export VISUAL='nano'
export PAGER='less'


# (Default) Language
if [[ -z "$LANG" ]]; then
  export LANG='en_GB.UTF-8'
fi


# Paths

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

fpath=(
  $HOME/.zfunc
  $fpath
)


# Set the list of directories that Zsh searches for programs.
path=(
  # $HOME/.yarn/bin
  # $HOME/.poetry/bin
  $path
  # $HOME/.cargo/bin
  # $HOME/.config/yarn/global/node_modules/.bin
)


# Less

# Set the default Less options.
export LESS='--hilite-search --ignore-case --RAW-CONTROL-CHARS --chop-long-lines --hilite-unread'
