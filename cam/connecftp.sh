#/bin/bash
# $1 is to test if we have to send all png
# usage : this_script fulltemp
fichierjpg="/img/cam$(date +"%m%d%Y%H").jpg"
fichiermp4="/img/cam$(date +"%m%d%Y%H").mp4"
login=""
server=""
site=""

if [[ $1 = "fulltemp" ]]
then
scp -i /home/pi/.ssh/id_rsa -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null /home/pi/cam/img/lastvideo.mp4 $login@$server:$site$fichiermp4
scp -i /home/pi/.ssh/id_rsa -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null /home/pi/cam/RRDtemp/mhour.png tbirckel@kim.terrier.im:echartet/img/mhour.png
scp -i /home/pi/.ssh/id_rsa -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null /home/pi/cam/RRDtemp/mday.png tbirckel@kim.terrier.im:echartet/img/mday.png
scp -i /home/pi/.ssh/id_rsa -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null /home/pi/cam/RRDtemp/mweek.png tbirckel@kim.terrier.im:echartet/img/mweek.png
scp -i /home/pi/.ssh/id_rsa -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null /home/pi/cam/RRDtemp/mmonth.png tbirckel@kim.terrier.im:echartet/img/mmonth.png
scp -i /home/pi/.ssh/id_rsa -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null /home/pi/cam/RRDtemp/myear.png tbirckel@kim.terrier.im:echartet/img/myear.png
elif [[ $1 = "boot" ]]
then
scp -i /home/pi/.ssh/id_rsa -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null /home/pi/cam/log/initboot.tar.gz tbirckel@kim.terrier.im:echartet/initboot.tar.gz


else
scp -i /home/pi/.ssh/id_rsa -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null /home/pi/cam/img/lastcapture.jpg tbirckel@kim.terrier.im:echartet$fichierjpg
scp -i /home/pi/.ssh/id_rsa -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null /home/pi/cam/RRDtemp/mhour.png tbirckel@kim.terrier.im:echartet/img/mhour.png
scp -i /home/pi/.ssh/id_rsa -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null /home/pi/cam/RRDtemp/mday.png tbirckel@kim.terrier.im:echartet/img/mday.png

fi
