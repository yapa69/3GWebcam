#!/usr/bin/env bash

# Exec paths
PYTHON_PATH=`which python`
BASH_PATH=`which bash`
TAR_PATH=`which tar`

# Dir paths
HOME_DIR="/home/pi/cam"

# Log paths
LOG_FILE="/tmp/sortiecam.log"
MAINTENANCE="/var/log/SSHmaintenance.log"

# FTP / SCP information (server to connect to, user, document root...)
R_USER="tbirckel"
R_SERVER="kim.terrier.im"
R_DIR="echartet"

L_SSH_KEY="/home/pi/.ssh/id_rsa"
SSH_OPTS="-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"
