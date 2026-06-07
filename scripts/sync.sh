#!/bin/sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
SOURCE_DIR=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)
CHEZMOI="${CHEZMOI:-$(command -v chezmoi)}"
GIT="${GIT:-$(command -v git)}"

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
