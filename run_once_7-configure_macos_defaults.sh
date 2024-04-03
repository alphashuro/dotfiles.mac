# dock 
##  autohide
### enable
defaults write com.apple.dock "autohide" -bool "true"
### remove delay
defaults write com.apple.dock "autohide-delay" -float "0"
### remove animation
defaults write com.apple.dock "autohide-time-modifier" -float "0" 
## recents
### disable
defaults write com.apple.dock "show-recents" -bool "false"

killall Dock

# finder
## show extensions
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
## show hidden
defaults write com.apple.finder "AppleShowAllFiles" -bool "true"
## show pathbar
defaults write com.apple.finder "ShowPathbar" -bool "true"
## keep folders on top
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"
## remove file extension warning dialog
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"

killall Finder

# desktop
## keep folders on top
defaults write com.apple.finder "_FXSortFoldersFirstOnDesktop" -bool "true"

killall Finder

# menubar
## set clock format
defaults write com.apple.menuextra.clock "DateFormat" -string "\"d MMM HH:mm:ss\""

# mouse
## disable acceleration
defaults write NSGlobalDomain com.apple.mouse.linear -bool "true"
## set speed
defaults write NSGlobalDomain com.apple.mouse.scaling -float "2.5"

# trackpad
## soft clicks
defaults write com.apple.AppleMultitouchTrackpad "FirstClickThreshold" -int "0"

# keyboard
## repeat key when held
defaults write NSGlobalDomain "ApplePressAndHoldEnabled" -bool "false"
## use fn key for dictation
defaults write com.apple.HIToolbox AppleFnUsageType -int "3"
## use standard function keys
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true

