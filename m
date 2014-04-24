From: William Frost <tsmrnd0@gmail.com>
Date: Thu, 24 Apr 2014 10:38:02 +0900
Subject: [Buildroot] adding DCMTK libraries to buildroot
Message-ID: <2656055.10Mv5CXMOB@linux-qsenn>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is far from being perfect but at list it is a start point to 
something better.
Known problems:
 - Building dynamic libraries is not optional. I prefer static linking for 
this library but it will be nice to leave this option to the users.
 - Every time I try to build buildroot DCMTK gets configured again, I
 must be doing something wrong. But it compiles just fine and install the
 libraries on staging/usr/lib.
This is is first time contributing so if I'm doing something wrong please let 
me know the right way to do it.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 17732-Signed-off-by-William-Frost-tsmrnd0-gmail.com.patch
Type: text/x-patch
Size: 5399 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140424/e38de9f6/attachment.bin>
