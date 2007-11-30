From: saravanan chanemouganandam <saravanan_sprt@hotmail.com>
Date: Fri, 30 Nov 2007 16:42:27 +0530
Subject: [Buildroot] kernel header 2.6.12
Message-ID: <BAY131-W15D44FED3FDE6342B12D24E2710@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi all,
 
I have downloaded the latest version of buildroot to build toolchain and small rootfs for my arm (armv5te) target pxa270. The board runs  linux 2.6.16 version and I want to replace the existing glibc rootfs with a small uclibc rootfs. 
 
Buildroot's make menuconfig doesn't show kernel header version 2.6.12 to build toolchain. Can anybody tell me how can I choose kernel header version 2.6.12 in toolchain option to build correct toolchain? 
 
will doing make DEFAULT_KERNEL_HEADERS=2.6.12 correcty build the toolchain arm-linux-uclibc-*?
 
Thanks
sara
 
 
 
_________________________________________________________________
Tried the new MSN Messenger? It?s cool! Download now.
http://messenger.msn.com/Download/Default.aspx?mkt=en-in
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071130/85995c30/attachment.htm 
