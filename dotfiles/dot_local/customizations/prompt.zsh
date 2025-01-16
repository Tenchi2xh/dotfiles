# Custom prompt

setopt PROMPT_SUBST

FG_GRAY="%F{239}"
FG_BLACK="%F{0}"
FG_CYAN="%F{39}"
FG_BRIGHT_CYAN="%F{45}"
FG_WHITE="%F{15}"
FG_YELLOW="%F{11}"
FG_DARK_GRAY="%F{234}"
FG_LIGHT_CYAN="%F{159}"

BG_GRAY="%K{239}"
BG_BLACK="%k"
BG_CYAN="%K{39}"
BG_BRIGHT_CYAN="%K{45}"
BG_YELLOW="%K{11}"
BG_DARK_GRAY="%K{234}"
BG_LIGHT_CYAN="%K{159}"

RESET="%f%k"

arrow_transition() {
  echo " ${1}${3}${2} "
}

arrow_transition_ns() {
  echo "${1}${3}${2}"
}

function tenchi_prompt() {
  prompt=""
  local git_info=""

  RPROMPT="${FG_GRAY}$(pwd)"

  prompt+="${BG_DARK_GRAY}${FG_GRAY} %D{%H:%M}"                     # Time
  prompt+=$(arrow_transition $FG_DARK_GRAY $FG_CYAN $BG_GRAY)       # >
  prompt+="${FG_CYAN}%n"                                            # User
  if [[ -n $VIRTUAL_ENV ]]; then
    prompt+=" @ ${FG_BRIGHT_CYAN}$(basename $VIRTUAL_ENV)"          # Virtual env
  fi
  prompt+=$(arrow_transition $FG_GRAY $FG_BLACK $BG_CYAN)           # >
  prompt+="${FG_BLACK}%1~"                                          # Directory

  if git rev-parse --is-inside-work-tree &>/dev/null; then
    local branch=$(git branch --show-current 2>/dev/null)
    local dirty=$(git status --porcelain 2>/dev/null)

    prompt+=$(arrow_transition $FG_CYAN $FG_BLACK $BG_BRIGHT_CYAN)  # >
    prompt+="${FG_BLACK}${branch}"                                  # Branch

    if [[ -n $dirty ]]; then
      prompt+=" $(arrow_transition_ns $FG_BRIGHT_CYAN $FG_LIGHT_CYAN $BG_LIGHT_CYAN)"
      prompt+="$(arrow_transition_ns $FG_LIGHT_CYAN $FG_WHITE $BG_BLACK) "
    else
      prompt+=$(arrow_transition $FG_BRIGHT_CYAN $FG_WHITE $BG_BLACK)
    fi
  else
    prompt+=$(arrow_transition $FG_CYAN $FG_WHITE $BG_BLACK)
  fi

  # Add PWD to iTerm2 title
  if [[ -n $ITERM_SESSION_ID ]]; then
    echo -ne "\033]0;${PWD##*/}\007"
  fi

  echo
  PROMPT="${prompt}${RESET}"
}

function blank() {
  echo
}

precmd_functions+=(tenchi_prompt)
preexec_functions+=(blank)
