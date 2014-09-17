
set -o noclobber
set -o vi

function parse_git_dirty {                                                                                        
  git diff --no-ext-diff --quiet --exit-code &> /dev/null || echo "*"                                             
}                                                                                                                 
                                                                                                                  
function parse_git_branch {                                                                                       
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"                  
}   

export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$(parse_git_branch)\$ "

alias cp="cp -i"
alias rm="rm -i"
alias mv="mv -i"
