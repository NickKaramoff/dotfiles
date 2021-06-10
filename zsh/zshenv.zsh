#!/usr/bin/env zsh
# Defines environment variables.

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

export DOTFILES="$HOME/.dotfiles"

export HIST_FILE="$HOME/.zsh_history"

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES # fixes python multiprocessing on macOS
