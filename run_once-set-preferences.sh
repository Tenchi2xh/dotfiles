#!/bin/bash

set -e

echo
echo "---"
echo "Applying system preferences..."
# For more settings see https://macos-defaults.com/ and https://github.com/chimurai/dotfiles/blob/master/run_once_90_macos_configuration.sh.tmpl

# Font antialiasing on retina screen makes text appear bold
defaults write -g AppleFontSmoothing -int 0
# Auto-hide dock
defaults write com.apple.dock "autohide" -bool true
# Set screenshots folder and don't show thumbnail
mkdir -p ~/Pictures/Screenshots
defaults write com.apple.screencapture "location" -string "~/Pictures/Screenshots"
defaults write com.apple.screencapture "show-thumbnail" -bool false
# Show seconds in status bar
defaults delete -g AppleICUForce12HourTime > /dev/null 2>&1 || true
defaults write com.apple.menuextra.clock "Show24Hour" -bool true
defaults write com.apple.menuextra.clock "IsAnalog" -bool false
defaults write com.apple.menuextra.clock "ShowDayOfWeek" -bool false
defaults write com.apple.menuextra.clock "ShowSeconds" -bool true
defaults write com.apple.menuextra.clock "DateFormat" -string "d MMM HH:mm:ss"
# defaults write com.apple.menuextra.clock "FlashDateSeparators" -bool true
# Show extensions in Finder
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool true
# Show path bar at the bottom of Finder
defaults write com.apple.finder "ShowPathbar" -bool true
# Default to column view in Finder
defaults write com.apple.finder "FXPreferredViewStyle" -string clmv
# Folders at the top in Finder
defaults write com.apple.finder "_FXSortFoldersFirst" -bool true
# Allow keyboard navigation in alert dialogs
defaults write NSGlobalDomain AppleKeyboardUIMode -int 2
# Disable keyboard auto-correct behaviors
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
# Set a fast key repeat rate
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 2
# Show battery percentage
defaults -currentHost write com.apple.controlcenter.plist BatteryShowPercentage -bool true

# Apply changes by killing all affected processes
echo "Restarting system processes..."
killall Dock
killall SystemUIServer
killall Finder
