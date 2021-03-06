#!/usr/bin/env bash

# Exec paths
PYTHON_PATH=`which python`
BASH_PATH=`which bash`
TAR_PATH=`which tar`

# Dir paths
HOME_DIR="/home/pi/3GWebcam/cam"

# Log paths
LOG_FILE="/tmp/sortiecam.log"
MAINTENANCE="/var/log/SSHmaintenance.log"

# FTP / SCP information (server to connect to, user, document root...)
R_USER="tu m'emmerdes ludovic avec tes conventions à la con"
R_SERVER="arrete de mirgrer"
R_DIR=""

L_SSH_KEY="/home/pi/.ssh/id_rsa"
SSH_OPTS="-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"
