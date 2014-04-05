export PATH=/usr/local/bin:$PATH

export PATH=/usr/local/sbin:$PATH

PATH=$PATH:/usr/local/mysql/bin:$HOME/bin
export PATH

. ~/.bashrc

function tabname {
  printf "\e]1;$1\a"
}

function winname {
  printf "\e]2;$1\a"
}

DART_SDK="~/.dart"
PATH=$PATH:$DART_SDK/bin
export PATH

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Setting PATH for EPD_free-7.3-2
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"
export PATH

export GOPATH=$HOME/dev/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$SCALA_HOME/bin
export PATH=$PATH:/usr/local/git/bin
export PATH=$PATH:~/dev/packer
