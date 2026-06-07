# dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Setup

Install `chezmoi`, then point it at this repository:

```sh
mkdir -p ~/.config/chezmoi
cat > ~/.config/chezmoi/chezmoi.toml <<'EOF'
sourceDir = "/path/to/this/repo"

[git]
autoAdd = true
autoCommit = true
autoPush = true
EOF
```

On this machine, the source directory is:

```text
/Users/shengjie/Documents/code/dotfiles
```

## Add Dotfiles

Add a file to chezmoi:

```sh
chezmoi add ~/.zshrc
```

Edit the real file as usual, then sync it back into the repository:

```sh
./scripts/sync.sh
```

`sync.sh` only re-adds files that are already managed by chezmoi. New files must
be added with `chezmoi add` first.

## Sync

Run:

```sh
./scripts/sync.sh
```

The script will:

- pull the latest changes with `git pull --rebase --autostash`
- apply the repository state with `chezmoi apply`
- re-add changed managed dotfiles with `chezmoi re-add`
- commit any changes
- push to the remote repository

The script resolves the repository path from its own location, so it can run
from any clone path.

## New Machine

Clone the repository, configure `sourceDir` to that clone path, then apply:

```sh
git clone git@github.com:shengjie77/dotfiles.git ~/Documents/code/dotfiles
chezmoi apply
```
