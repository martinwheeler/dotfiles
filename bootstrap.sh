#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

# git pull origin master;

function doIt() {
  # PowerLevel9k
  if [ -d "~/.oh-my-zsh" ] && [ ! -d "~/.oh-my-zsh/custom/themes/powerlevel9k" ]; then git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k; fi

  # Copy dotfiles
  rsync --exclude ".git/" \
    --exclude ".DS_Store" \
    --exclude "bootstrap.sh" \
    --exclude "brew.sh" \
    --exclude "setup.sh" \
    --exclude ".macos" \
    --exclude "zsh.sh" \
    --exclude "README.md" \
    --exclude "my-terminal.svg" \
    --exclude "LICENSE-MIT.txt" \
    -avh --no-perms . ~;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
