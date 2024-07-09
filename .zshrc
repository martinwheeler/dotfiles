#|------------------------------------------------------------|#
#| Env variables                                              |#
#|------------------------------------------------------------|#
export DEFAULT_USER=$(whoami)

# This provides a global env for your auth token
if [ -f "~/.npmrc" ];
then
  export NPM_AUTH_TOKEN=$(cat ~/.npmrc | sed s#//registry.npmjs.org/:_authToken=##g)
fi

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

if [ -d "~/.composer" ];
then
  export PATH="~/.composer/vendor/bin:$PATH"
fi

#|------------------------------------------------------------|#
#| Extras                                                     |#
#|------------------------------------------------------------|#
source $HOME/.exports
source $HOME/.aliases
source $HOME/.zsh_functions
source $HOME/.functions

# Z-Jump https://github.com/rupa/z
source "$HOME/z.sh"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(tmuxifier init -)"
eval "$(starship init zsh)"
