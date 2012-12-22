export PATH=/usr/local/bin:$PATH

export PATH=/usr/local/sbin:$PATH

PATH=$PATH:/usr/local/mysql/bin:$HOME/bin
export PATH

. ~/.bashrc

alias g5='cd ~/g5/core/; sudo nginx; unicorn_rails'
alias g5kill='cd ~/g5/core/; sudo nginx -s stop;'

#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
