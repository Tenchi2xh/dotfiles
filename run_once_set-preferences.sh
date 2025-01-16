#!/bin/bash

set -e

echo
echo "---"
echo "Applying system preferences..."
# For more settings, see:
# - https://macos-defaults.com/
# - https://github.com/chimurai/dotfiles/blob/master/run_once_90_macos_configuration.sh.tmpl
# - https://github.com/mathiasbynens/dotfiles/blob/main/.macos

# Close System Settings to avoid it overriding our changes
osascript -e 'tell application "System Settings" to quit'

# Font antialiasing on retina screen makes text appear bold
defaults write -g AppleFontSmoothing -int 0

# Auto-hide dock
defaults write com.apple.dock "autohide" -bool true

# Don't show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

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
# Four-letter codes for the other view modes: Nlsv, icnv, clmv, glyv
defaults write com.apple.finder "FXPreferredViewStyle" -string "clmv"

# Folders at the top in Finder
defaults write com.apple.finder "_FXSortFoldersFirst" -bool true

# Allow keyboard navigation in alert dialogs
defaults write NSGlobalDomain "AppleKeyboardUIMode" -int 3

# Disable keyboard auto-correct behaviors
defaults write NSGlobalDomain "NSAutomaticCapitalizationEnabled" -bool false
defaults write NSGlobalDomain "NSAutomaticDashSubstitutionEnabled" -bool false
defaults write NSGlobalDomain "NSAutomaticPeriodSubstitutionEnabled" -bool false
defaults write NSGlobalDomain "NSAutomaticQuoteSubstitutionEnabled" -bool false
defaults write NSGlobalDomain "NSAutomaticSpellingCorrectionEnabled" -bool false

# Set a fast key repeat rate
defaults write NSGlobalDomain "InitialKeyRepeat" -int 15
defaults write NSGlobalDomain "KeyRepeat" -int 2

# Show battery percentage
defaults -currentHost write com.apple.controlcenter.plist "BatteryShowPercentage" -bool true

# Expand save panel by default
defaults write NSGlobalDomain "NSNavPanelExpandedStateForSaveMode" -bool true
defaults write NSGlobalDomain "NSNavPanelExpandedStateForSaveMode2" -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool false

# Disable "natural" scrolling
defaults write NSGlobalDomain "com.apple.swipescrolldirection" -bool false

# Set language and text formats
defaults write NSGlobalDomain "AppleLocale" -string "en_US@currency=EUR"
defaults write NSGlobalDomain "AppleMeasurementUnits" -string "Centimeters"
defaults write NSGlobalDomain "AppleMetricUnits" -bool true

# Set home as the default location for new Finder windows
defaults write com.apple.finder "NewWindowTarget" -string "PfLo"
defaults write com.apple.finder "NewWindowTargetPath" -string "file://${HOME}/"

# Finder: show status bar
defaults write com.apple.finder "ShowStatusBar" -bool false

# Finder: show path bar
defaults write com.apple.finder "ShowPathbar" -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf"

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices "DSDontWriteNetworkStores" -bool true
defaults write com.apple.desktopservices "DSDontWriteUSBStores" -bool true

# Setup hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen
# Bottom-left corner: start screen saver
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0
# Bottom-right corner: lock screen
defaults write com.apple.dock wvous-bl-corner -int 13
defaults write com.apple.dock wvous-bl-modifier -int 0


# Apply changes by killing all affected processes
echo "Restarting system processes..."
killall Dock
killall SystemUIServer
killall Finder
