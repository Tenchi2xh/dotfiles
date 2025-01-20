# Custom transient prompt

last_cmd="nonempty"

function transient() {
  local lines=$(echo "$1" | wc -l)
  lines=$(( lines + 2 ))
  echo -ne "\e[${lines}A\e[2K\e[38;5;236m${(l:COLUMNS::─:)}\e[0m\e[${lines}B"

  if [[ -n "${1//[[:space:]]/}" ]]; then
    echo
  fi
}

function transient_pre() {
  last_cmd=$1
  transient $1
}

function transient_post() {
  if [[ -z "${last_cmd//[[:space:]]/}" ]]; then
    transient ""
  else
    last_cmd=
  fi
}

