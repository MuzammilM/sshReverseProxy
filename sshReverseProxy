#!/bin/bash
# Title: Creates a reverse ssh proxy tunnel.
# Author: MuzammilM

sshport=22
remoteport=1997
server=user@example.com
if ! [ -x "$(which autossh)" ]; then
        echo 'Error: autossh is not installed.'
        sudo apt-get install autossh -y
        exit
fi
kill -15 `ps aux | grep autossh | awk '{print $2}'`
echo "Creating ssh proxy redirect from local port: "$sshport" to remote port: "$remoteport" via server: "$server
`which autossh` -M 0 -f -o ServerAliveInterval=240 -N -R $remoteport:localhost:$sshport $server
