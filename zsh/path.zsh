# Apple Silicon / Intel どちらでも対応
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# dotfiles の bin/ を PATH に追加
export PATH="$HOME/dotfiles/bin:$PATH"
