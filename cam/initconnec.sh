#!/usr/bin/env bash

############################################
#
# Connexion 3G + FTP
#
# Tim
############################################

# Get variables from configuration file
source conf.sh

${TAR_PATH} zcf ${HOME_DIR}/log/initboot.tar.gz /var/log/syslog

#at boot
${BASH_PATH} /home/pi/cam/ppp-on
sleep 30

service ntp stop
ntpdate pool.ntp.org
service ntp start

#send trought ftp
${BASH_PATH} ${HOME_DIR}/connecftp.sh boot

${BASH_PATH} /home/pi/cam/ppp-off
