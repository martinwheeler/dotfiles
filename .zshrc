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

# PHP
# export PATH="$(brew --prefix php)/bin:$PATH"

# Android Studio Dev
# export USE_CCACHE=1
# export CCACHE_COMPRESS=1
# export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"

#|------------------------------------------------------------|#
#| Extras                                                     |#
#|------------------------------------------------------------|#
source $HOME/.exports
source $HOME/.aliases
source $HOME/.zsh_functions
source $HOME/.functions

# Z-Jump https://github.com/rupa/z
source "$HOME/z/z.sh"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(tmuxifier init -)"
eval "$(starship init zsh)"
