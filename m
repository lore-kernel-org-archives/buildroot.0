From: Tim Barr <tbarr@multitech.com>
Date: Wed, 20 Aug 2008 10:13:22 -0500
Subject: [Buildroot] Adding new processors and boards to buildroot
Message-ID: <1CD05B980C94AC408B37C82BBABAA3E60D554DB5@mtsexchange.dc.multitech.prv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

How does something like this actually get done in buildroot? We have a
design based on the Atmel AT91SAM9G20 part, and the guy working with me
on software had to make a lot of modifications to the Timesys build in
order to support a different Ethernet MAC chip using the MII interface,
use the 32Mbit DataFlash, Use a 16 bit NAND Flash, boot from the NAND
Flash, and make some other I/O pin assignment different from the the EK
board. We are also using uboot 1.3.3 and had to modify it to work with
MII and a 16 bit NAND Flash. He is creating diff files so that other
people can setup the same compile code, how do you do something like
this in buildroot? I assume it has something to do with the config files
in the target directory.
 
And how do you set up buildroot to create a JFFS2 root filesystem for
the NAND Flash? Is it considered a parallel flash?? There is only an
option for DataFlash or parallel flash when I run menuconfig.
 


Timothy Barr
Hardware Development Engineer
for Multi-Tech Systems, Inc.
 <mailto:tbarr@multitech.com> tbarr at multitech.com 

 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080820/d1dd20c3/attachment-0001.htm 
