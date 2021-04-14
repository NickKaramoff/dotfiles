#
# Loads asdf.
#
# Authors:
#   Nikita Karamov <nick@karamoff.dev>
#

# Load manually installed asdf into the shell session.
if [ -e "$HOME/.asdf/asdf.sh" ]; then
  . "$HOME/.asdf/asdf.sh"

# Load package manager installed goenv into the shell session.
elif (( $+commands[asdf] )); then
  . "$(brew --prefix asdf)/asdf.sh"

# Return if requirements are not found.
elif (( ! $+commands[asdf] )); then
  return 1
fi
