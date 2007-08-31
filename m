From: Tim Harvey <tim_harvey@yahoo.com>
Date: Thu, 30 Aug 2007 22:32:14 -0700 (PDT)
Subject: [Buildroot]  [PATCH] quagga
Message-ID: <864997.9050.qm@web35603.mail.mud.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

I'm pretty new to buildroot but I've found that a great number of packages
don't build (at least for my armeb platform).  I'm happy to submit patches for
those I fix, so let me know if I'm not using the correct format.

Attached is a patch for quagga that addresses the following issues:
 - bumps version to 0.99.8 
   which fixes the 'error: expected specifier-qualifier-list before '__u64' 
   build issue
 - fixes link issue of not using MALLOC_GLIBC_COMPAT
 - removes static libs from target after install

Hope this is useful,

Tim
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 06-quagga.patch
Type: text/x-patch
Size: 1052 bytes
Desc: 2255237146-06-quagga.patch
Url : http://busybox.net/lists/buildroot/attachments/20070830/776bdc20/attachment.bin 
