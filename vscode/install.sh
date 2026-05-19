#!/bin/sh
#
# VS Code の settings.json / keybindings.json を symlink で配置する。
# Application Support 配下なので *.symlink 規則では扱えないため自前で。

set -e

VSCODE_DIR="$HOME/Library/Application Support/Code/User"
DOTFILES_VSCODE="$(cd "$(dirname "$0")" && pwd)"

mkdir -p "$VSCODE_DIR"

for f in settings.json keybindings.json; do
  src="$DOTFILES_VSCODE/$f"
  dst="$VSCODE_DIR/$f"

  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    echo "  Backing up existing $f to $f.backup"
    mv "$dst" "$dst.backup"
  fi

  ln -sf "$src" "$dst"
  echo "  Linked $f"
done

echo "  VS Code settings linked."
