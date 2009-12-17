From: NEAL, RYAN <RYAN_NEAL@appsig.com>
Date: Thu, 17 Dec 2009 13:15:56 -0800
Subject: [Buildroot] [buildroot] telnetd and udhcpc
Message-ID: <4B2CB099CF3D4F40B1B1442281CA94FFCED852@EXCHANGEVS01.appsig.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heya!

 

I was looking though the configuration in buildroot, and I couldn't find
the option to enable the telnetd in busybox?  I tried enabling the
busybox packages, but to no avail. :(.  I could only find info about the
--- when using search.  Is this the package I should be using?  Could
you point me to the right box to check?  Thanks!!!!

 

The second problem I am having is the udhcpc.  How do I get that to be
run at startup?  Do I need to  directly edit the S40_network script or
the inittab?  The build I have right now is coming up fine doing dhcp
for an address but the resolve.conf is not being populated unless I
manually run the udhcpc script.   I have the kernel set to have the IP:
DHCP support enabled (CONFIG_IP_PNP_DHCP).  Should I disable this and
then somehow set it to call the udhcpc in busybox?  

 

Thanks again.  You all have been a tremendous help!

 

:: Ryan Neal

490/279

408-774-2747

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091217/4c4da547/attachment.htm>
