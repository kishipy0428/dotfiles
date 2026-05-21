# dotfiles

@kishipy0428 の個人 dotfiles。macOS + zsh 環境向け。
[holman/dotfiles](https://github.com/holman/dotfiles) の構造を参考にしている。

## 構造

トピック単位でディレクトリを切る方式。

- `bin/` — `$PATH` に通る実行ファイル
- `topic/*.zsh` — シェル起動時に自動 source される
- `topic/path.zsh` — 最初に読み込まれる (PATH 用)
- `topic/install.sh` — `script/install` で実行される
- `topic/*.symlink` — 拡張子を除いた名前で `$HOME` にシンボリックリンクされる

## トピック一覧

- `zsh/` — シェル設定 (`zshrc.symlink`, `path.zsh`, `aliases.zsh`, `prompt.zsh`)
- `git/` — git 設定、エイリアス、グローバル gitignore
- `homebrew/` — Brewfile と install スクリプト
- `mise/` — mise の shell activation
- `tmux/` — tmux 設定
- `vscode/` — VS Code settings / keybindings
- `claude/` — Claude Code インストーラ
- `codex/` — OpenAI Codex CLI インストーラ

## script

- `script/bootstrap` — `*.symlink` を `$HOME` にリンク
- `script/install` — 各トピックの `install.sh` を実行 (Brewfile, VS Code 設定など)
- `script/status` — symlink が正しく張られているか確認

## bin

- `bin/dot` — `brew update` + `script/install` を実行するメンテコマンド

## インストール

```sh
git clone https://github.com/kishipy0428/dotfiles.git ~/dotfiles
cd ~/dotfiles
script/bootstrap
script/install
```

インストール後、`script/status` で symlink の状態を確認できる。

## カスタマイズ

### 個人設定 (~/.gitconfig.local)

git の `[user]` (name, email) は `~/.gitconfig.local` に書き、git 管理外にしている。
新しいマシンでは以下を手で作成する:

```
[user]
    name = Your Name
    email = your@email.com
```

`git/gitconfig.symlink` の `[include]` がこれを読み込む。

### Brewfile

`homebrew/Brewfile` を編集してパッケージを取捨選択。
編集後は `dot` または `brew bundle --file=homebrew/Brewfile` で反映。

## 更新

```sh
dot   # brew update + script/install
```
