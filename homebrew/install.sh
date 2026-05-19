#!/bin/sh
#
# Homebrew
#
# Homebrew が未インストールならインストールし、Brewfile の中身を bundle する。

if test ! "$(command -v brew)"; then
  echo "  Installing Homebrew for you."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Apple Silicon の場合 brew は /opt/homebrew にあるので shellenv で PATH を通す
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "  Running brew bundle..."
brew bundle --file="$(dirname "$0")/Brewfile"

exit 0
