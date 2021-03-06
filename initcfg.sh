#!/bin/bash

#TODO:Automate file reading,hardlinking and directory creation based on files in myconfig
echo "You are about to deploy hardlinks of files in repository into the parent directory..."
echo
echo "Deploying this configuration will OVERWRITE YOUR EXISTING CONFIGURATION"
echo -n "Are you sure? 'yes' or 'no':"
read REPLY
if $REPLY == "yes"; then
  localreponame=${PWD##*/}
  rsync -av --link-dest=../$localreponame ../$localreponame/ ../
else
    echo Aborted
    exit 0
fi
# --manual scripting without rsync------
#echo "Deploying this configuration would most certainly OVERWRITE YOUR EXISTING CONFIGURATION"
#echo -n "Are you sure? 'yes' or 'no':"
#
#read REPLY
#if [[ $REPLY == "yes" ]]; then
#
#	# Select the directory of vim snippets
#	vimsnippath="~/.vim/plugged/vim-snippets/UltiSnips"
#
#	# Initialise the the local repository location and name...
#	# Note:The repository name is better kept as myconfig
#	localreponame=${PWD##*/}
#	localrepo=$PWD
#
#	# NOTE: This script smartly deploys the file in the parent directory of the local repository
#	# 	So it is advised to keep the repo in $HOME directory
#	cd ../
#
#	# Create oldconfig to move existing config files here
#	mkdir -p oldconfig
#
#	# Level $HOME
#		# For latexmk
#		mv .latexmk ./oldconfig
#		ln myconfig/.latexmk
#		mv .latexmkrc ./oldconfig
#		ln myconfig/.latexmkrc
#		
#		# For vimrc
#		ln myconfig/.vimrc
#		mv .vimrc ./oldconfig
#
#	# Level down $HOME
#		# For zathurarc
#		cp -lR ./myconfig/.config ./
#		
#		# For texmf
#		cp -lR ./myconfig/texmf ./
#else
#    echo Aborted
#    exit 0
#fi
