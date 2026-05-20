#!/bin/sh
#
# iTerm2 のカラースキームをインポートする。
# .itermcolors を `open` で開くと iTerm2 が自動でインポートしてくれる。
# 一度インポートしたものは ~/.cache/dotfiles に記録してスキップする。

set -e

DOTFILES_ITERM="$(cd "$(dirname "$0")" && pwd)"

# iTerm2 がインストールされていなければスキップ
if [ ! -d "/Applications/iTerm.app" ]; then
  echo "  iTerm2 is not installed, skipping."
  exit 0
fi

STATE_DIR="$HOME/.cache/dotfiles"
STATE_FILE="$STATE_DIR/iterm2-imported"
mkdir -p "$STATE_DIR"
touch "$STATE_FILE"

imported_any=0
for scheme in "$DOTFILES_ITERM"/*.itermcolors; do
  [ -e "$scheme" ] || continue
  name="$(basename "$scheme")"
  if grep -Fxq "$name" "$STATE_FILE"; then
    continue
  fi
  echo "  Importing $name"
  open "$scheme"
  echo "$name" >> "$STATE_FILE"
  imported_any=1
done

if [ "$imported_any" = "1" ]; then
  echo "  iTerm2 color schemes imported."
  echo "  → iTerm2 > Settings > Profiles > Colors > Color Presets で選択してください"
fi
