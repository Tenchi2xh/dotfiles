# Custom transient prompt

last_cmd="nonempty"

function transient() {
  local lines=$(echo "$1" | wc -l)
  local clear=""

  for ((i = 1; i <= lines; i++)); do
    clear+="\e[A\e[2K"
  done

  # TODO: manually colorize $1
  echo -ne "$clear\e[2A\e[2K\e[G \e[38;5;39m❱\e[0m  "
  echo $ZSH_HIGHLIGHT_LAST_BUFFER_HIGHLIGHTED
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

