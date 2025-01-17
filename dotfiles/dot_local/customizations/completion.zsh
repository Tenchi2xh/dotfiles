# Based on https://github.com/Phantas0s/.dotfiles/blob/master/zsh/completion.zsh
# Augmented by following the above author's tutorial on https://thevaluable.dev/zsh-completion-guide-examples/

# Load more completions
fpath=(.local/customizations/zsh-completions $fpath)

# Should be called before compinit
zmodload zsh/complist

autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files

# setopt GLOB_COMPLETE      # Show autocompletion menu with globs
setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.

# Ztyle pattern
# :completion:<function>:<completer>:<command>:<argument>:<tag>

# Define completers
zstyle ':completion:*' completer _extensions _complete # _approximate

# Use cache for commands using cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "~/Library/Caches/zsh/.zcompcache"
# Complete the alias when _expand_alias is used as a function
zstyle ':completion:*' complete true

# Allow you to select in a menu
zstyle ':completion:*' menu select

# Autocomplete options for cd instead of directory stack
zstyle ':completion:*' complete-options true

zstyle ':completion:*' file-sort modification

zstyle ':completion:*:*:*:*:corrections' format "
%F{0}%K{$MONOKAI_YELLOW}%k%F{$MONOKAI_YELLOW} %d %f"
zstyle ':completion:*:*:*:*:descriptions' format "
%F{0}%K{$MONOKAI_GREEN}%k%F{$MONOKAI_GREEN} %d %f"
zstyle ':completion:*:*:*:*:messages' format "
%F{0}%K{$MONOKAI_PURPLE}%k%F{$MONOKAI_PURPLE} %d %f"
zstyle ':completion:*:*:*:*:warnings' format "
%F{0}%K{$MONOKAI_RED}%k%F{$MONOKAI_RED} no match found %f"

# Colors for files and directory, inherit from colors.zsh's LS_COLORS
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}

# Only display some tags for the command cd
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
# zstyle ':completion:*:complete:git:argument-1:' tag-order !aliases

# Required for completion to be in good groups (named after the tags)
zstyle ':completion:*' group-name ''

zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands

# See ZSHCOMPWID "completion matching control"
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*' keep-prefix true

zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# Don't insert tabs
zstyle ':completion:*' insert-tab false

## For kubernetes
source ~/.local/customizations/zsh-completions/_kubectl
zstyle ':completion:*:*:kubectl:*' list-grouped false
