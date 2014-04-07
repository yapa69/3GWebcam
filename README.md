![image](http://echartet.birckel.eu/img/logo3GWebcam.png)
========

Prerequesites Camera :

> apt-get install wvdial ftp

Git clone the project in your home directory
> git clone http://github.com/yapa69/3GWebcam

Edit 3GWebcam-conf.sh to match with your local directory and copy to ***/usr/local/bin***
> sudo cp 3GWebcam-conf.sh /usr/local/bin

Copy wvdial.conf to ***/etc/wvdial.conf*** (or adapt to your 3G provider, change the PIN code, scripts are made to use 100 MB/ month)
> cp wvdial.conf /etc

Fill root crontab (crontab -e) with :
```cron
0 12 * * * /bin/bash -x /home/pi/3GWebcam/cam/pushcam.sh MP4 fulltemp
0 9,16 * * * /bin/bash -x /home/pi/3GWebcam/cam/pushcam.sh HD
0 10,11,13,14,15,17,18 * * *  /bin/bash -x /home/pi/3GWebcam/cam/pushcam.sh LD
30 12,18 * * * /bin/bash -x /home/pi/3GWebcam/cam/maintenance.sh 1500
*/5 * * * * /home/pi/3GWebcam/cam/readtemp.pl > /dev/null
0 8 * * 6 /sbin/shutdown -r now
```

Boot script
> sudo ln -s /home/pi/3GWebcam/cam/initconnec.sh /etc/init.d/initconnec.sh



Edit ***/etc/modules*** and load module in this order (to avoid an issue between camera and spi/i2c) :
```
w1-therm
w1-gpio pullup=1
i2c-dev
i2c-bcm2708
spi-bcm2708
snd-bcm2835
```

Remove CRON completely from syslog

Replace in ***/etc/rsyslog.conf*** :

> *.*;auth,authpriv.none             -/var/log/syslog

by

> *.*;auth,authpriv,cron.none             -/var/log/syslog

 
