#|------------------------------------------------------------|#
#| Env variables                                              |#
#|------------------------------------------------------------|#
export DEFAULT_USER=$(whoami)

# Disabled by default - this provides a global env for your auth token
# export NPM_AUTH_TOKEN=$(cat ~/.npmrc | sed s#//registry.npmjs.org/:_authToken=##g)

export EDITOR=vim

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

# Uncomment to enable composer bin in path
export PATH="~/.composer/vendor/bin:$PATH"

# PHP
export PATH="$(brew --prefix php)/bin:$PATH"

# Android Studio Dev
# export USE_CCACHE=1
# export CCACHE_COMPRESS=1
# export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"

#|------------------------------------------------------------|#
#| Oh my zsh                                                  |#
#|------------------------------------------------------------|#
export ZSH=$HOME/.oh-my-zsh

COMPLETION_WAITING_DOTS="true"

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir newline vcs)
#POWERLEVEL9K_COLOR_SCHEME='light'
POWERLEVEL9K_DIR_BACKGROUND='skyblue'
plugins=(z git git-flow npm docker zsh-autosuggestions kubectl completion zsh)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

#|------------------------------------------------------------|#
#| Extras                                                     |#
#|------------------------------------------------------------|#
source $HOME/.exports
source $HOME/.aliases
source $HOME/.zsh_functions
source $HOME/.functions

source $HOME/z.sh

# Changes the colour of the top bar in terminal
echo -e "\033]6;1;bg;red;brightness;255\a"
echo -e "\033]6;1;bg;green;brightness;0\a"
echo -e "\033]6;1;bg;blue;brightness;255\a"

# Disabled by default as NVM install will add this anyhow
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion