#!/bin/sh
#
# OpenAI Codex CLI
#
# Codex CLI が未インストールなら Homebrew で入れる。

if test "$(command -v codex)"; then
  echo "  Codex CLI already installed."
  exit 0
fi

if ! test "$(command -v brew)"; then
  echo "  Homebrew not found. Install Homebrew first (script/install)."
  exit 1
fi

echo "  Installing Codex CLI for you."
brew install codex
