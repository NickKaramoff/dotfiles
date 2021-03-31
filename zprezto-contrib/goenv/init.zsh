#
# Loads the goenv.
#
# Authors:
#   Nikita Karamov <nick@karamoff.dev>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Zeh Rizzatti <zehrizzatti@gmail.com>
#

# Load manually installed goenv into the shell session.
if [[ -s "${GOENV_ROOT:=$HOME/.goenv}/bin/goenv" ]]; then
  path=("${GOENV_ROOT}/bin" $path)
  eval "$(goenv init - --no-rehash zsh)"

# Load package manager installed goenv into the shell session.
elif (( $+commands[goenv] )); then
  eval "$(goenv init - --no-rehash zsh)"

# Return if requirements are not found.
elif (( ! $+commands[go] )); then
  return 1
fi

export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
