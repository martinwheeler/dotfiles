#!/usr/bin/env bash

# Switch to using brew-installed zsh as default shell
if ! fgrep -q '/usr/local/bin/zsh' /etc/shells; then
  echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells
  chsh -s /usr/local/bin/zsh
fi

# Install other useful binaries.
brew bundle --file=./Brewfile

# Remove outdated versions from the cellar.
brew cleanup
