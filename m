From: Tim Barr <tbarr@multitech.com>
Date: Fri, 18 Jan 2008 15:16:54 -0600
Subject: [Buildroot] Problem making 2.6.22.1 based arm buildroot
Message-ID: <1CD05B980C94AC408B37C82BBABAA3E609BFD2D4@mtsexchange.dc.multitech.prv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Running with a 1-15-08 snapshot, I tried to make files for a
AT91SAM9260EK board using the AT91SAM9260pf_defconfig .config file. The
make process failed during the module portion of the build. For some
reason a 2.6.22.1-rt9 directory was created in the ./root/lib/modules
directory. The make process then failed because a 2.6.22.1 directory
does not exist when trying to create a modules.dep file.  
 


Timothy Barr
Hardware Development Engineer
for Multi-Tech Systems, Inc.
 <mailto:tbarr@multitech.com> tbarr at multitech.com 

 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080118/5fb641ce/attachment.htm 
