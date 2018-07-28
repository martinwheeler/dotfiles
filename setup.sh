#!/usr/bin/env bash

# Ask for administrator upfront
sudo -v

# Keep-alive; update existing `sudo` timestamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Fix permissions encase they are not set for current user
sudo chown -R "$USER":admin /usr/local

# XCode tools
xcode-select --install

# Homebrew install & update
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Zsh
brew install zsh zsh-completions

brew tap caskroom/fonts
brew cask install font-dejavu-sans-mono-for-powerline
brew cask install font-fira-code

#PHP
brew install php
brew services start php

# DNSMasq - .dev domains :)
# brew install dnsmasq
#cd $(brew --prefix); mkdir etc; echo 'address=/.test/127.0.0.1' > etc/dnsmasq.conf
#sudo cp -v $(brew --prefix dnsmasq)/homebrew.mxcl.dnsmasq.plist /Library/LaunchDaemons
#sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
#sudo mkdir /etc/resolver
#sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/test'

# NVM Install
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash