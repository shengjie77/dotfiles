#!/bin/sh
set -eu

SOURCE_DIR="/Users/shengjie/Documents/code/dotfiles"
CHEZMOI="${CHEZMOI:-/opt/homebrew/bin/chezmoi}"
GIT="${GIT:-/opt/homebrew/bin/git}"

cd "$SOURCE_DIR"

if [ -d .git/rebase-merge ] || [ -d .git/rebase-apply ] || [ -f .git/MERGE_HEAD ]; then
  echo "Git is already in a merge or rebase state; aborting."
  exit 1
fi

"$GIT" pull --rebase --autostash
"$CHEZMOI" apply
"$CHEZMOI" re-add

"$GIT" add -A

if "$GIT" diff --cached --quiet; then
  echo "No dotfile changes to commit."
else
  "$GIT" commit -m "Auto-sync dotfiles"
fi

"$GIT" push
