# dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Setup

Install `chezmoi`, then initialize this repository:

```sh
chezmoi init --apply git@github.com:$GITHUB_USERNAME/dotfiles.git
```

For this repository, replace `$GITHUB_USERNAME` with:

```sh
shengjie77
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

Initialize and apply the dotfiles:

```sh
chezmoi init --apply git@github.com:shengjie77/dotfiles.git
```
