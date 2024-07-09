#!/usr/bin/env bash

# Ask for administrator upfront
sudo -v

# Keep-alive; update existing `sudo` timestamp until script has finished
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

# Fix permissions encase they are not set for current user
sudo chown -R "$USER":admin /usr/local

# XCode tools
xcode-select --install

# Homebrew install & update
if [ ! -f "/usr/local/bin/brew" ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Zsh
brew install zsh zsh-completions

brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

# NVM Install
if [[ ! -d "${HOME}/.nvm" ]]; then
  export NVM_DIR="" # Just encase we have this env variable floating around
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
fi
