alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'

alias reload='source ~/.zshrc'
alias edit-dotfiles='code ~/dotfiles'

# bin/dot 実行後に zshrc を自動で読み直す (PATH や alias の更新を即反映)
dot() {
  "$HOME/dotfiles/bin/dot" "$@" && source ~/.zshrc
}
