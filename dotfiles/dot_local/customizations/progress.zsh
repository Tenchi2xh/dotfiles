TOTAL_BAR_LENGTH=20

progress_bar() {
    local color=$1
    local current=$2
    local max=$3

    local completed=$(echo "scale=0; $current * $TOTAL_BAR_LENGTH / $max" | bc)
    local remaining=$(echo "scale=0; $TOTAL_BAR_LENGTH - $completed" | bc)

    local line=$(printf "\033[38;5;%dm" "$color")

    for ((i = 0; i < completed; i++)); do
        line+="━"
    done

    line+="\033[38;5;238m"

    if ((remaining > 0)); then
        line+="╺"
        ((remaining--))
    fi

    for ((i = 0; i < remaining; i++)); do
        line+="━"
    done

    echo -e "${line}\033[0m"
}
