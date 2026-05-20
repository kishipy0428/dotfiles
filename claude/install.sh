#!/bin/sh
#
# Claude Code
#
# Claude Code が未インストールなら公式インストーラで入れる。

if test "$(command -v claude)"; then
  echo "  Claude Code already installed."
  exit 0
fi

echo "  Installing Claude Code for you."
curl -fsSL https://claude.ai/install.sh | bash
