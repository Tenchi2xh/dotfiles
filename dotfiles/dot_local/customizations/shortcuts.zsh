# Shortcuts, functions, aliases

# Redefine ls
alias ls="ls --color=auto -lha"
# Redefine tree
alias tree="tree -CF --dirsfirst"
# Redefine grep
alias grep="grep --color=auto"
# Redefine cmatrix
alias cmatrix="cmatrix -abs"

# Create directories and cd to them
function mcd () { mkdir -p "$@" && eval cd "\"\$$#\""; }
# grep current folder for pattern
function gr() { grep -r "$*" "`pwd`"; }
# Syntax highlighted less
function pless() { pygmentize -f terminal256 -g -P style=monokai $* | less -FiXRM; }
# Displays which ports are being listened to
alias ports='netstat -ap tcp | grep -i "listen"'
# Shows how much size files or folders in the current directory use
alias sizes="du -sch .[!.]* * | gsort -h"
# ls but for tracked git files
alias gls='git ls-files | awk -F / '"'"'{print $1}'"'"' | uniq | xargs ls -dl'
# Pipe into these to transform ANSI codes to HTML
alias html="ansifilter -H -f"
alias copyhtml="html | pbcopy"
# Pipe into this for a less that supports colors
alias colorless="less -FiXRM"
# Returns the line number of a given character index in a file
function lineno() { python -c "f=open('$1','r');print(f.read()[:$2].count('\n')+1);f.close()"; }
# Imgcat but small previews
function imgcat_small() { imgcat "$1" | sed 's/inline=1/inline=1;width=256px/'; }
# Use brew's nano
alias nano="/opt/homebrew/bin/nano"
# Shortcut for ptpython (better REPL)
alias py="PYTHONPATH=. python -m ptpython"
# Git shortcuts
alias gcm="git checkout master"
alias gp="git pull"
# Automatically download video in clipboard URL
function yt() { yt-dlp "`pbpaste`"; }
# Automatically download audio in clipboard URL
function ytmp3() { yt-dlp "`pbpaste`" --extract-audio --audio-format mp3; }
# Shortcut for Chrome
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
# Shortcut for chezmoi
alias cm="chezmoi"
# Python aliases
alias python="python3"
alias pip="pip3"
# Activate virtual env for current Poetry project
alias pactivate='source $(poetry show -v | sed -n 1p | sed "s/^.*: \(.*\)$/\1/")/bin/activate'
# Quick shortcut for calculating stuff
function p() { python -c "print($*)"; }
# Removes all python cache files
alias pyclean="find . \( -name \*.pyc -o -name \*.pyo -o -name __pycache__ -o -name .mypy_cache -o -name .pytest_cache \) -prune -exec rm -rf {} +"
# Code golfing
alias pyth="~/Development/pyth/pyth.py"
alias pythc="~/Development/pyth/run_pyth.py"
alias pythd="pythc -d"
# Removes all scala cache files
alias scalaclean="find . -name "target" -type d | xargs rm -rf"
