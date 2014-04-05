#!/usr/bin/env bash

############################################
#
# @boot: Date synch + logs sent to server
#
# Tim
############################################

# Get variables from configuration file
source /home/pi/3GWebcam/cam/conf.sh


mkdir ${HOME_DIR}/log
${TAR_PATH} zcfP ${HOME_DIR}/log/initboot.tar.gz /var/log/syslog

#at boot
${BASH_PATH} ${HOME_DIR}/ppp-on
sleep 30

service ntp stop
ntpdate pool.ntp.org
service ntp start

#send trought ftp
${BASH_PATH} ${HOME_DIR}/connecftp.sh boot

${BASH_PATH} ${HOME_DIR}/ppp-off
