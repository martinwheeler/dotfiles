#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
  # Copy dotfiles
  rsync --exclude ".git/" \
    --exclude ".DS_Store" \
    --exclude "bootstrap.sh" \
    --exclude "brew.sh" \
    --exclude "setup.sh" \
    --exclude ".macos" \
    --exclude ".macos" \
    --exclude "README.md" \
    --exclude "my-terminal.svg" \
    --exclude "LICENSE-MIT.txt" \
    -avh --no-perms . ~;

  source ~/.zshrc && \
  source setup.sh && \
  source brew.sh && \
  source .macos;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
