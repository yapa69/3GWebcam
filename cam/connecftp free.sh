#/bin/bash
# $1 is to test if we have to send all png
# usage: this_script fulltemp
IP_address="ftpperso.free.fr"
username=""
password=""
fichierjpg="/img/cam$(date +"%m%d%Y%H").jpg"
fichiermp4="/img/cam$(date +"%m%d%Y%H").mp4"

if [[ $1 = "fulltemp" ]]
then

echo "open $IP_address
user $username $password
put /home/pi/cam/img/lastvideo.mp4 $fichiermp4
put /home/pi/cam/RRDtemp/mhour.png /img/mhour.png
put /home/pi/cam/RRDtemp/mday.png /img/mday.png
put /home/pi/cam/RRDtemp/mweek.png /img/mweek.png
put /home/pi/cam/RRDtemp/mmonth.png /img/mmonth.png
put /home/pi/cam/RRDtemp/myear.png /img/myear.png
bye
" | ftp -n

elif [[ $1 = "boot" ]]
then
echo "open $IP_address
user $username $password
put /home/pi/cam/log/initboot.tar.gz initboot.tar.gz
bye
" | ftp -n


else

echo "open $IP_address
user $username $password
put /home/pi/cam/img/lastcapture.jpg $fichierjpg
put /home/pi/cam/RRDtemp/mhour.png /img/mhour.png
put /home/pi/cam/RRDtemp/mday.png /img/mday.png
bye
" | ftp -n

fi
