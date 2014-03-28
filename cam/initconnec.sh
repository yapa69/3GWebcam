#!/bin/bash

############################################
#
# Connexion 3G + FTP
#
# Tim
############################################


#at boot
#/bin/bash /home/pi/cam/ppp-on
#sleep 30

ntpdate

#send trought ftp
tar zcf /home/pi/cam/log/initboot.tar.gz /var/log/syslog
/bin/bash /home/pi/cam/connecftp.sh boot

#/bin/bash /home/pi/cam/ppp-off
