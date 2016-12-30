From: Ricardo Herrero <ricardo.herrero@gmail.com>
Date: Fri, 30 Dec 2016 13:00:14 +0100
Subject: [Buildroot] Aid for buildroot compilation
Message-ID: <CABLXdK8G7SH+Zy88hLguJ0WqEOQE-h9MaG_8rQwzHQNeTyVK9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

 I have been trying to make with buildroot 2016.05 many times and I?m
getting always the same error. I wanted to confirm if my problem is due to
my self incompetence or if there has been an update which has changed
something that affects my setup. I send the error and the .config file. If
this is not the right list to ask for help, can you guide me to the correct
one? Thanks in advance for the help.

This is the error when I make:

*In file included from img2srec.c:55:0:*
*os_support.h:22:22: fatal error: compiler.h: No such file or directory*
* #include "compiler.h"*
*                      ^*
*compilation terminated.*
*/home/dte/Documents/de1soc/buildroot-2016.05/output/build/uboot-rel_acds13.0sp1/lib/crc32.c:12:20:
fatal error: common.h: No such file or directory*
* #include <common.h>*
*                    ^*
*compilation terminated.*
*gcc -O2
-I/home/dte/Documents/de1soc/buildroot-2016.05/output/host/usr/include   -o
mkenvimage.o mkenvimage.c -c*
*/home/dte/Documents/de1soc/buildroot-2016.05/output/build/uboot-rel_acds13.0sp1/rules.mk:64
<http://rules.mk:64>: recipe for target 'img2srec.o' failed*
*make[3]: *** [img2srec.o] Error 1*
*make[3]: *** Waiting for unfinished jobs....*
*Makefile:251: recipe for target 'crc32.o' failed*
*make[3]: *** [crc32.o] Error 1*
*make[3]: *** wait: No child processes.  Stop.*
*Makefile:548: recipe for target 'tools' failed*
*make[2]: *** [tools] Error 2*
*package/pkg-generic.mk:195 <http://pkg-generic.mk:195>: recipe for target
'/home/dte/Documents/de1soc/buildroot-2016.05/output/build/uboot-rel_acds13.0sp1/.stamp_built'
failed*
*make[1]: ***
[/home/dte/Documents/de1soc/buildroot-2016.05/output/build/uboot-rel_acds13.0sp1/.stamp_built]
Error 2*
*Makefile:36: recipe for target '_all' failed*
*make: *** [_all] Error 2*

If you want I can send the .config file

Thanks for the help again,
Best Regards, Ricardo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161230/3d587462/attachment.html>
