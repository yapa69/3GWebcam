#!/usr/bin/env bash

############################################
#
# Connexion 3G + FTP
#
# Tim
############################################

# Exit as soon as a command does not return 0
set -e

# Get variables from configuration file
source conf.sh

# Heat the resistor
${PYTHON_PATH} ${HOME_DIR}/chauffe.py
sleep 5

# Create png
${BASH_PATH} ${HOME_DIR}/RRDtemp/createpng.sh

# Get pictures from the cam
if [ "$1" = HD ] ; then
	echo "HD"
	raspistill -o ${HOME_DIR}/img/lastcapture.jpg -w 960 -h 720 -q 50 -n
fi

if [ "$1" = LD ] ; then
	echo "LD"
	raspistill -o ${HOME_DIR}/img/lastcapture.jpg -w 640 -h 480 -q 40 -n
fi

if [ "$1" = MP4 ] ; then
	echo "MP4"
	raspivid -o ${HOME_DIR}/img/lastvideo.h264 -t 10000 --bitrate 1000000 -w 640 -h 480 -fps 12 -n
	rm $HOME_DIR/img/lastvideo.mp4
	sleep 1
	MP4Box -fps 12 -add ${HOME_DIR}/img/lastvideo.h264 ${HOME_DIR}/img/lastvideo.mp4
fi

# Connect in 3G
sleep 5
${BASH_PATH} ${HOME_DIR}/ppp-on
sleep 30

# Send trought ftp
if [ "$2" = fulltemp ] ; then
	echo "full temperature requested"
	${BASH_PATH} ${HOME_DIR}/connecftp.sh fulltemp
else
	${BASH_PATH} ${HOME_DIR}/connecftp.sh
fi
sleep 5

${BASH_PATH} ${HOME_DIR}/ppp-off
