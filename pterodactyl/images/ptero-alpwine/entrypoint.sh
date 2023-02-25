cd /home/container

# Output Current Wine Version
wine --version

# If .wine directory doesn't exist, copy backup
if [ ! -d /home/container/.wine ]; 
then echo "Wineprefix not found, initialiizing wine" && winecfg && /usr/sbin/winetricks
echo "Configured Succesfully"
fi;

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo "Running ${MODIFIED_STARTUP}"

# Run the Server
# Run the Server
( cd /blackops2 && exec xvfb-run wine ${MODIFIED_STARTUP} )