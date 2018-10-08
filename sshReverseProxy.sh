#!/bin/bash

# Title: Creates a reverse ssh proxy tunnel.
# Crontab : * * * * *
# Author: MuzammilM

sshport=22
remoteport=1998
server=user@example.com

if ! [ -x "$(which autossh)" ]; then
        echo 'Error: autossh is not installed.'
        sudo apt-get install autossh -y
        exit
fi

cnt=`ps aux | grep autossh | grep -v grep | wc -l`

if [ $cnt = 0 ]
then
        echo "Creating ssh proxy redirect from local port: "$sshport" to remote port: "$remoteport" via server: "$server
        `which autossh` -M 14141 -f -o ServerAliveInterval=240 -N -R $remoteport:localhost:$sshport $server
fi
