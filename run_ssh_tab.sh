#!/usr/bin/env bash
#
# Open new iTerm window from the command line using v3 syntax for applescript as needed in iTerm2 Version 3+
# This script blocks until the cmd is executed in the new iTerm2 window.  It then leaves the window open. 
# TODO Add option to close iTerm2 after cmd execs


# See also https://www.iterm2.com/documentation-scripting.html
#
# Usage:
#     iterm                   Opens the current directory in a new iTerm window
#     iterm [PATH]            Open PATH in a new iTerm window
#     iterm [CMD]             Open a new iTerm window and execute CMD
#     iterm [PATH] [CMD] ...  You can prob'ly guess
#
# Example:
#     iterm ~/Code/HelloWorld ./setup.sh
#
# References:
#     iTerm AppleScript Examples:
#     https://gitlab.com/gnachman/iterm2/wikis/Applescript
# 
# Credit:
#     Forked from https://gist.github.com/vyder/96891b93f515cb4ac559e9132e1c9086
#     Inspired by tab.bash by @bobthecow
#     link: https://gist.github.com/bobthecow/757788
#

# OSX only
[ `uname -s` != "Darwin" ] && echo 'OS X Only' &&return

function iterm () {
    local cmd=""
    local wd="$PWD"
    local args="$@"

    if [ -d "$1" ]; then
        wd="$1"
        args="${@:2}"
    fi

    if [ -n "$args" ]; then
        # echo $args
        cmd="$args"
    fi

   # osascript &>/dev/null <<EOF
    osascript <<EOF
tell application "iTerm2"
    activate
    set new_window to (create window with default profile)
    delay 1
    tell new_window
        delay 1
        tell current session
            set name to "R1"
            write text "cd ~/Vagrant/ine_vios_01"
            write text "vgs R1"
            set name to "R1"            
            delay 1            
        end tell
        create tab with default profile 
        tell current session
            write text "cd ~/Vagrant/ine_vios_01"
            write text "vgs R2"
            set name to "R2"            
            delay 1
        end tell
        create tab with default profile 
        tell current session
            write text "cd ~/Vagrant/ine_vios_01"
            write text "vgs R3"
            set name to "R3"                        
            delay 1
        end tell
        create tab with default profile 
        tell current session
            write text "cd ~/Vagrant/ine_vios_01"
            write text "vgs R4"
            set name to "R4"                        
            delay 1
        end tell
        create tab with default profile 
        tell current session
            write text "cd ~/Vagrant/ine_vios_01"
            write text "vgs R5"
            set name to "R5"                        
            delay 1
        end tell
        create tab with default profile 
        tell current session
            write text "cd ~/Vagrant/ine_vios_01"
            write text "vgs R6"
            set name to "R6"                        
            delay 1
        end tell
        create tab with default profile 
        tell current session
            write text "cd ~/Vagrant/ine_vios_01"
            write text "vgs R7"
            set name to "R7"                        
            delay 1
        end tell
        create tab with default profile 
        tell current session
            write text "cd ~/Vagrant/ine_vios_01"
            write text "vgs R8"
            set name to "R8"                        
            delay 1
        end tell
        create tab with default profile         
        delay 1
        tell current session
            set name to "vIOS"
            write text "cd ~/Vagrant/ine_vios_01"
            delay 1            
        end tell



    end tell
end tell
EOF
}
iterm $@