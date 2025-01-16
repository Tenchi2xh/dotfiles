#!/bin/bash

set -e

echo
echo "---"
echo "Configuring apps..."

# Sublime Text

wget -nv "https://packagecontrol.io/Package%20Control.sublime-package" -O ~/Library/"Application Support"/"Sublime Text"/"Installed Packages"/"Package Control.sublime-package"

# iTerm2

defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.config/iterm"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# Visual Studio Code

vscode_extensions=(
    "bierner.markdown-preview-github-styles"
    "marp-team.marp-vscode"
    "ms-python.debugpy"
    "ms-python.python"
    "ms-python.vscode-pylance"
    "pkief.material-icon-theme"
    "svelte.svelte-vscode"
    "teabyii.ayu"
    "viktorzetterstrom.non-breaking-space-highlighter"
)

vscode_installed_extensions=$(code --list-extensions)

for extension in ${vscode_extensions[@]}; do
    if echo "$vscode_installed_extensions" | grep -q "^$extension$"; then
        echo "Extension '$extension' is already installed."
    else
        echo "Installing extension '$extension'..."
        echo code --install-extension "$extension"
    fi
done
