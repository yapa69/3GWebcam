#!/usr/bin/perl
use strict;
use warnings;

#&check_modules;
&get_device_IDs;

my $in_correction = 0;
my $out_correction = 0;
my $cpu_correction = 0;
my $count = 0;
my $reading = -1;
my $device = -1;
my @deviceIDs;
my @temp_readings;

foreach $device (@deviceIDs) {
	$reading = &read_device($device);
    if ($reading == 9999) {
       $reading = "U";
    }
            
    push(@temp_readings,$reading);
}

$reading = &read_device("cpu");
push(@temp_readings,$reading);

if ($temp_readings[1] ne 'U') {$temp_readings[1] -= $in_correction;}
if ($temp_readings[0] ne 'U') {$temp_readings[0] -= $out_correction;}
if ($temp_readings[2] ne 'U') {$temp_readings[2] -= $cpu_correction;}


#update the database
system("/usr/bin/rrdtool update /home/pi/3GWebcam/cam/RRDtemp/multirPItemp.rrd N:$temp_readings[1]:$temp_readings[0]:$temp_readings[2]");
print "Temp in = $temp_readings[1]    Temp out = $temp_readings[0]  Temp cpu = $temp_readings[2]\n";

sub check_modules {
	my $mods = `cat /proc/modules`;
	if ($mods =~ /w1_gpio/ && $mods =~ /w1_therm/) {
	#print "w1 modules already loaded \n";
	} else {
		print "loading w1 modules \n";
    	`sudo modprobe w1-gpio`;
    	`sudo modprobe w1-therm`;
	} 
}

sub get_device_IDs {
	# The Hex IDs off all detected 1-wire devices on the bus are stored in the file
	# "w1_master_slaves"    

	# open file
	#open(FILE, "/sys/bus/w1/devices/w1_bus_master1/w1_master_slaves") or die("Unable to open file");
 
	# read file into an array
	@deviceIDs = ("28-000003553078","28-0000045875df"); # close file 
	#close(FILE);
}

sub read_device {
    #takes one parameter - a device ID
    #returns the temperature if we have something like valid conditions
    #else we return "9999" for undefined
	my $ret = 9999;
    my $deviceID = $_[0];
	my $sensordata = "";    
    
	if ($deviceID ne "cpu") {
    	$deviceID =~ s/\R//g;
 
    	#my $ret = 9999; # default to return 9999 (fail)
   
    	$sensordata = `cat /sys/bus/w1/devices/${deviceID}/w1_slave 2>&1`;
    	print "Read: $sensordata";
   

   		if(index($sensordata, 'YES') != -1) {
      		#fix for negative temps from http://habrahabr.ru/post/163575/
      		$sensordata =~ /t=(\D*\d+)/i;
      		#$sensor_temp =~ /t=(\d+)/i;
      		$sensordata = (($1/1000));
      		$ret = $sensordata;
   		} else { print ("CRC Invalid for device $deviceID.\n"); }

	} else {	
		$sensordata = `cat /sys/class/thermal/thermal_zone0/temp 2>&1`;
		print "Read: $sensordata";
        $ret = ($sensordata/1000)
	}
   	return ($ret);
}
