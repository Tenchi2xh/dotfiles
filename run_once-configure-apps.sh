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
