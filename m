From: Tim Barr <tbarr@multitech.com>
Date: Mon, 31 Mar 2008 17:00:17 -0500
Subject: [Buildroot] Kernel not happy on at91sam9260ek board.
Message-ID: <1CD05B980C94AC408B37C82BBABAA3E60AE5A7F3@mtsexchange.dc.multitech.prv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have built a 2.6.22.1 kernel using buildroot, but the rfs won't load.
The error looks like the kernel is looking for a 16 bit NAND device but
only finds an 8 bit one. The errors are:
 
NAND device: Manufacturer ID: 0xec, Chip ID: 0xda (Samsung NAND 256MiB
3,3V 8-bit) 

NAND bus width 16 instead 8 bit 

No NAND device found!!! 

and:
 
List of all partitions: 

No filesystem could mount root, tried: jffs2 

Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(0,0) 

 

Is there some setting in a .config file somewhere that I am missing or
have wrong? Where do I need to look to fix this?

 


Timothy Barr
Hardware Development Engineer
for Multi-Tech Systems, Inc.
 <mailto:tbarr@multitech.com> tbarr at multitech.com 

 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080331/888797cc/attachment.htm 
