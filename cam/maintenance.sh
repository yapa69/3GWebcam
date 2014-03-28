#!/bin/bash

############################################
#
# Maintenance fo reverse SSH (NAT connexion)
#
# Ludovic
############################################

#/bin/bash /home/pi/cam/ppp-off
date >>/var/log/SSHmaintenance.log
kill -9 `ps aux | grep "[N]R 22222" | awk '{print $2}'` &>>/var/log/SSHmaintenance.log
/bin/bash /home/pi/cam/ppp-on &>>/var/log/SSHmaintenance.log
sleep 30

ssh -i /home/pi/.ssh/id_rsa -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -NR 22222:localhost:22 tbirckel@kim.terrier.im &
sleep $1
kill -9 `ps aux | grep "[N]R 22222" | awk '{print $2}'` &>>/var/log/SSHmaintenance.log
printf "Fin maintenance ok\n" >> /var/log/SSHmaintenance.log
/bin/bash /home/pi/cam/ppp-off
