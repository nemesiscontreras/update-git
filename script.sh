#!/bin/bash

#Script to install Git (and Homebrew ) then replace the PATH to Apple's local git distro with the newly installed

#checking the current Apple version of Git

function version_git {
		echo "This is the version of Apples Git:" 
		git --version
		sleep 1
		echo "This is the path to it"
		which git
}

version_git


#If Homebrew is not installed then install it

if test ! $(which brew); then
	echo "Installing Homebrew..."
	sleep 1
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

#Installing Git via Homebrew
echo "now installing git....."
brew install git 

#Replacing Apple git distro PATH with the local one installed
function set_path{
		echo "Setting path to the local git distro instead of the Apple one...."
		export PATH=/usr/local/bin:$PATH
		echo "The current version should now be:"
		git --version
		echo "Let's make it permanet now.."
		brew link --overwrite git
}

set_path
sleep 1

#goodbye message 
echo "to update git in the future run: brew upgrade git"
echo "bye bye (^._.^)ﾉ"





