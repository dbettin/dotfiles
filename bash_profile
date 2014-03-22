export PATH=/usr/local/bin:$PATH

export PATH=/usr/local/sbin:$PATH

PATH=$PATH:/usr/local/mysql/bin:$HOME/bin
export PATH

. ~/.bashrc

alias g5='cd ~/g5/core/; sudo nginx; unicorn_rails'
alias g5kill='cd ~/g5/core/; sudo nginx -s stop;'

function tabname {
  printf "\e]1;$1\a"
}

function winname {
  printf "\e]2;$1\a"
}

#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"
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

export PATH="$PATH:$HOME/dev/elixir/bin"
export GOPATH=$HOME/dev/go
export PATH=$PATH:$GOPATH/bin
export SCALA_HOME=$HOME/dev/scala
export PATH=$PATH:$SCALA_HOME/bin
export PATH=$PATH:~/dev/packer
export PATH=$PATH:~/dev/julia/lang/julia
