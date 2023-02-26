#!/bin/bash
cd /home/container

# Information output
echo "Running on Debian $(cat /etc/debian_version)"
echo "Current timezone: $(cat /etc/timezone)"
wine --version

if [ ! -d /home/container/.wine ]; 
then echo "Wineprefix not found, initialiizing wine" && /usr/sbin/winetricks
echo "Configured Succesfully"
fi;

# Create Shortcuts for zone files
if [ ! -e /blackops2/Server/Zombie/zone ];
then ln -s /blackops2/Server/zone /home/container/Server/Zombie/zone
fi;
if [ ! -e /blackops2/Server/Multiplayer/zone ];
then ln -s /blackops2/Server/zone /home/container/Server/Multiplayer/zone
fi;

# Setup Virtual Screen 
# Xvfb :0 -screen 0 1024x768x16 -nolisten unix
# export DISPLAY=:0.0
export WINEDEBUG=fixme-all

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo "Running ${MODIFIED_STARTUP}"

# Run the Server
( cd /blackops2/Plutonium && exec xvfb-run wine ${MODIFIED_STARTUP} )