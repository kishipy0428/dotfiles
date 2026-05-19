# mise activation (Brewfile でインストール済みなら有効化)
if command -v mise &> /dev/null; then
  eval "$(mise activate zsh)"
fi
