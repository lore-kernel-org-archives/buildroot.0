From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 28 Mar 2007 20:52:40 -0700
Subject: [Buildroot] [buildroot 0001293]: Can't build 20070328: configure:
	error: get libusb 0.1.8 or newer
Message-ID: <e861b13e021f6577ba12f399e52174e8@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1293 
====================================================================== 
Reported By:                tony_cureington
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1293
Category:                   Other
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-28-2007 20:52 PDT
Last Modified:              03-28-2007 20:52 PDT
====================================================================== 
Summary:                    Can't build 20070328: configure: error: get libusb
0.1.8 or newer
Description: 
I've attached the .config file that should contain all the info needed to
repro. I just extracted buildroot-20070328.tar.bz2, make menuconfig, make,
and got this error. I've tried earlier builds and they had the same
problem.

checking for strtoul... yes
checking for uname... yes
checking for usb_get_string_simple in -lusb... no
configure: error: get libusb 0.1.8 or newer
make: ***
[/home/tony/Buildroot/buildroot/build_i486/usbutils-0.72/.configured]
Error 1
[tony at penguin buildroot]$

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-28-07 20:52  tony_cureingtonNew Issue                                    
03-28-07 20:52  tony_cureingtonStatus                   new => assigned     
03-28-07 20:52  tony_cureingtonAssigned To               => buildroot       
03-28-07 20:52  tony_cureingtonFile Added: dot_config                       
======================================================================
