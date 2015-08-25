
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export PATH=/usr/local/mysql/bin:$PATH

export VERSIONER_PYTHON_PREFER_64_BIT=yes
export VERSIONER_PYTHON_PREFER_32_BIT=no

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"


export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
export VIRTUALENVWRAPPER_PYTHON='/usr/local/Cellar/python/2.7.6_1/bin/python'
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

source ~/.git-completion.bash
source ~/.bash_aliases

PATH=$PATH:/opt/android-sdk
PATH=$PATH:/opt/android-sdk/tools
PATH=$PATH:/opt/android-sdk/platform-tools
PATH=$PATH:/opt/apache_ant
PATH=$PATH:/opt/pidcat

ANDROID_SDK=/opt/android-sdk
ANDROID_HOME=/opt/android-sdk

export GRADLE_HOME=~/Library/Gradle
export PATH=$PATH:$GRADLE_HOME/bin
export PATH=$PATH:/Applications/Postgres93.app/Contents/MacOS/bin/

PYTHONDONTWRITEBYTECODE=1

