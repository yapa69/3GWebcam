#!/usr/bin/env bash

############################################
#
# Maintenance for reverse SSH (NAT connexion)
#
# Ludovic
############################################

# Exit as soon as a command does not return 0
set -e

# Get variables from configuration file
source /usr/local/bin/3GWebcam-conf.sh

#/bin/bash ${HOME_DIR}/ppp-off
kill -9 `ps aux | grep "[N]R 22222" | awk '{print $2}'` &
$BASH_PATH ${HOME_DIR}/ppp-on &
sleep 30

ssh -i ${L_SSH_KEY} ${SSH_OPTS} -NR 22222:localhost:22 ${R_USER}@${R_SERVER} &
sleep $1
kill -9 `ps aux | grep "[N]R 22222" | awk '{print $2}'` &
$BASH_PATH ${HOME_DIR}/ppp-off
