#!/bin/sh
#
# This script allows to create administrative rights user on the local Mac
# and provide remotely access using SSH protocols
#
# uncomment row down for create admin home folder if need
#mkdir /Users/admin

# uncomment and edit the line below if you have an administrator home folder
#mv /Users/admin /Users/

# create a user with administrative privileges
dscl . -create /Users/admin RealName "Local Administrator"
dscl . -create /Users/admin NFSHomeDirectory /Users/admin
dscl . -create /Users/admin UserShell /bin/bash
dscl . -create /Users/admin UniqueID 500
dscl . -create /Users/admin PrimaryGroupID 20
dscl . -passwd /Users/admin '<YouStrongPassword>'
dscl . -append /Groups/admin GroupMembership admin

# set administrative privileges to admin home folder
chown -R -f admin:staff /Users/admin

# set hiddn to admin user in welcome screen
defaults write /Library/Preferences/com.apple.loginwindow HiddenUsersList -array-add admin

# sets remote login (SSH) on
systemsetup -f -setremotelogin on
