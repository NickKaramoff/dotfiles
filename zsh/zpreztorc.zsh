#!/usr/bin/env zsh
# Sets Prezto options.


# General

# Color output (auto set to 'no' on dumb terminals).
zstyle ':prezto:*:*' color 'yes'

# Add additional directories to load prezto modules from
zstyle ':prezto:load' pmodule-dirs "$HOME/.zprezto-contrib"

# Allow module overrides when pmodule-dirs causes module name collisions
zstyle ':prezto:load' pmodule-allow-overrides 'yes'

# Set the Prezto modules to load
# The order matters.
zstyle ':prezto:load' pmodule \
  'environment' \
  'history' \
  'directory' \
  'spectrum' \
  'utility' \
  'completion' \
  'syntax-highlighting' \
  'history-substring-search' \
  'autosuggestions' \
  'prompt' \
  'git' \
  'pacman' \
  'node' \
  'python' \
  'ruby' \
  'gpg' \
  'ssh' \
  'asdf'


# Autosuggestions

# Set the query found color.
zstyle ':prezto:module:autosuggestions:color' found 'fg=241'


# Prompt

# Set the prompt theme
zstyle ':prezto:module:prompt' theme 'powerlevel10k'
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Pacman

# Set pacman frontend
zstyle ':prezto:module:pacman' frontend 'yay'

# Python

# Auto switch the Python virtualenv on directory change.
# zstyle ':prezto:module:python:virtualenv' auto-switch 'yes'

# Don't initialize virtualenvwrapper if pre-requisites are met.
zstyle ':prezto:module:python:virtualenv' initialize 'no'


# SSH

# Set the SSH identities to load into the agent.
zstyle ':prezto:module:ssh:load' identities 'id_rsa' 'id_ed25519'


# Syntax Highlighting

# Set syntax highlighters.
# By default, only the main highlighter is enabled.
zstyle ':prezto:module:syntax-highlighting' highlighters \
  'main' \
  'brackets' \
  'pattern' \
  'root'

# Set syntax pattern styles.
zstyle ':prezto:module:syntax-highlighting' pattern \
  'rm*-rf*' 'fg=white,bold,bg=red'


# Terminal

# Auto set the tab and window titles.
zstyle ':prezto:module:terminal' auto-title 'yes'

# Set the window and tab title format.
zstyle ':prezto:module:terminal:window-title' format '%n@%m: %s'
zstyle ':prezto:module:terminal:tab-title' format '%m: %s'
