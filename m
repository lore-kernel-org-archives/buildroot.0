From: Vellemans, Noel <Noel.Vellemans@visionBMS.com>
Date: Fri, 9 Dec 2011 08:41:08 +0100
Subject: [Buildroot] Buildroot - udev : undefined reference to `accept4'
Message-ID: <1531E53627F1F749B4FE809BF2A4EB6702D56EBD@WETMEX10.loepfe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

When compiling udev-173 with uClibc 0.9.32 for ARM you get the following
error:

udev/udev-ctrl.o: In function `udev_ctrl_get_connection':
udev-ctrl.c:(.text.udev_ctrl_get_connection+0x44): undefined reference
to `accept4'
collect2: ld returned 1 exit status
make[3]: *** [udev/udevd] Error 1
make[3]: *** Waiting for unfinished jobs....


A patch is already available 
Ref to https://bugs.busybox.net/show_bug.cgi?id=4195 

http://lists.uclibc.org/pipermail/uclibc-cvs/2011-November/029930.html 
http://lists.uclibc.org/pipermail/uclibc-cvs/2011-November/029935.html


Regards Noel

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111209/ea279089/attachment.html>
