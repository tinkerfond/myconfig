#!/bin/bash

echo
echo "You are about to deploy hardlinks of files in the repository onto the parent directory with same directory structure..\e[5m.\e[0m"
echo
echo "Deploying this configuration will OVERWRITE YOUR EXISTING CONFIGURATION"
echo -n "Are you sure? 'yes' or 'no':"
read REPLY
if [ $REPLY = "yes" ]
then
  rsync -av --exclude-from='EXCLUDE' --link-dest=$PWD ./ ../
else
  echo Aborted
  exit 0
fi
