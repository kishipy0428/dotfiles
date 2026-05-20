#!/bin/sh
#
# iTerm2 のカラースキームをインポートする。
# .itermcolors を `open` で開くと iTerm2 が自動でインポートしてくれる。

set -e

DOTFILES_ITERM="$(cd "$(dirname "$0")" && pwd)"

# iTerm2 がインストールされていなければスキップ
if [ ! -d "/Applications/iTerm.app" ]; then
  echo "  iTerm2 is not installed, skipping."
  exit 0
fi

# .itermcolors を全部インポート
for scheme in "$DOTFILES_ITERM"/*.itermcolors; do
  [ -e "$scheme" ] || continue
  echo "  Importing $(basename "$scheme")"
  open "$scheme"
done

echo "  iTerm2 color schemes imported."
echo "  → iTerm2 > Settings > Profiles > Colors > Color Presets で選択してください"
