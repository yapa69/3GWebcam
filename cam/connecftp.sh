#!/usr/bin/env bash

# Get variables from configuration file
source /usr/local/bin/3GWebcam-conf.sh

# $1 is to test if we have to send all png
# usage : this_script fulltemp
fichierjpg="/img/cam$(date +"%m%d%Y%H").jpg"
fichiermp4="/img/cam$(date +"%m%d%Y%H").mp4"
login=""
server=""
site=""

if [ "$1" = fulltemp ] ; then
	scp -i ${L_SSH_KEY} ${SSH_OPTS} ${HOME_DIR}/img/lastvideo.mp4 ${R_USER}@${R_SERVER}:${R_DIR}$fichiermp4
	scp -i ${L_SSH_KEY} ${SSH_OPTS} ${HOME_DIR}/RRDtemp/mhour.png ${R_USER}@${R_SERVER}:${R_DIR}/img/mhour.png
	scp -i ${L_SSH_KEY} ${SSH_OPTS} ${HOME_DIR}/RRDtemp/mday.png ${R_USER}@${R_SERVER}:${R_DIR}/img/mday.png
	scp -i ${L_SSH_KEY} ${SSH_OPTS} ${HOME_DIR}/RRDtemp/mweek.png ${R_USER}@${R_SERVER}:${R_DIR}/img/mweek.png
	scp -i ${L_SSH_KEY} ${SSH_OPTS} ${HOME_DIR}/RRDtemp/mmonth.png ${R_USER}@${R_SERVER}:${R_DIR}/img/mmonth.png
	scp -i ${L_SSH_KEY} ${SSH_OPTS} ${HOME_DIR}/RRDtemp/myear.png ${R_USER}@${R_SERVER}:${R_DIR}/img/myear.png
elif [ "$1" = boot ] ; then
	scp -i ${L_SSH_KEY} ${SSH_OPTS} ${HOME_DIR}/log/initboot.tar.gz ${R_USER}@${R_SERVER}:${R_DIR}/initboot.tar.gz
else
	scp -i ${L_SSH_KEY} ${SSH_OPTS} ${HOME_DIR}/img/lastcapture.jpg ${R_USER}@${R_SERVER}:${R_DIR}$fichierjpg
	scp -i ${L_SSH_KEY} ${SSH_OPTS} ${HOME_DIR}/RRDtemp/mhour.png ${R_USER}@${R_SERVER}:${R_DIR}/img/mhour.png
	scp -i ${L_SSH_KEY} ${SSH_OPTS} ${HOME_DIR}/RRDtemp/mday.png ${R_USER}@${R_SERVER}:${R_DIR}/img/mday.png
fi
