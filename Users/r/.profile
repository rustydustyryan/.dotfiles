
alias sz="source ~/.bash_profile"

# Configure dotfiles
# Reference: https://mitxela.com/projects/dotfiles_management

alias dotfiles='git --git-dir=/Users/r/.dotfiles --work-tree=/'

dot(){
  if [[ "$#" -eq 0 ]]; then
    (cd /
    for i in $(dotfiles ls-files); do
      echo -n "$(dotfiles -c color.status=always status $i -s | sed "s#$i##")"
      echo -e "¬/$i¬\e[0;33m$(dotfiles -c color.ui=always log -1 --format="%s" -- $i)\e[0m"
    done
    ) | column -t -s '¬'
  else
    dotfiles $*
  fi
}

# Configure git

alias ga="git add -A"
alias gc="git commit"
alias gcm="git commit -m"
alias gd="git diff"
alias gds="gid diff --stat"
alias gdc="git diff --cached"
alias gdsc="git diff --stat --cached"
alias gdcs="git diff --stat --cached"
alias gf="git fetch"
alias gl="git log"
alias gp="git push"
alias gpl="git pull"
alias gst="git stash"
alias gsh="git show"
alias gs="git status"

# This lets us borrow `git diff`'s autocomplete
function gdl() {
  if [[ "$@" =~ "^.*(-h|--help).*$" ]]; then
    git diff $@
  else
    # By default, set `--stat` to window width using a max of 80 $COLUMNS
    set -- $(/usr/bin/sed -E "s,--stat( |$),--stat=${COLUMNS}\1,g" <<< $@)
    git diff \
      --color=always \
      $@ \
    | less \
      --clear-screen \
      --dumb \
      --quiet \
      --raw-control-chars \
      --squeeze-blank-lines \
      --underline-special \
      --LONG-PROMPT
  fi
}
alias gdl="git diff"
unalias gdl

export VOLTA_HOME="$HOME/.volta"

# Configure PATH
eval "$(/opt/homebrew/bin/brew shellenv)"
$(/opt/homebrew/bin/brew shellenv)
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
