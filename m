From: jeff angielski <jeff@theptrgroup.com>
Date: Mon, 02 Feb 2009 17:29:05 -0500
Subject: [Buildroot] can't open /dev/tty No such device or address
Message-ID: <1233613745.7613.23.camel@penguin>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I am getting the following errors when trying to boot a CRAMFS image on
my PowerPC target.

can't open /dev/tty1: No such device or address
can't open /dev/tty2: No such device or address
can't open /dev/tty3: No such device or address
<repeats over and over>


If I log into the system through my serial port (/dev/ttyCPM0) you can
see that the char devs exist in the fileystem.

crw-rw-rw-  1 root     root       4,   1 Dec 31 17:00 tty1             
crw-rw-rw-  1 root     root       4,   2 Dec 31 17:00 tty2             
crw-rw-rw-  1 root     root       4,   3 Dec 31 17:00 tty3  


The node info matches the device_table.txt.

Any idea what is going on here?  Anybody else seeing this?


-- 
Jeff Angielski
The PTR Group
www.theptrgroup.com
