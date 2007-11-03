From: m4D <cmd4ever@inbox.ru>
Date: Sat, 3 Nov 2007 22:46:10 +0300
Subject: [Buildroot] softfloat target gcc for armv5tel-iwmmxt-eabi is broken?
Message-ID: <000801c81e52$38dd7c10$0c00000a@m4dfb3dd1981e5>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi, guys.

i'm new to buildroot and this list, so i'm sorry if my questions have already been answered thousand times (i used search, honest))

i'm building basic rootfs for pxa272 (armv5?te?, ?little-endian?, *iwmmxt*, *eabi*) with "softfloat by default" option enabled. the compilation and rootfs creation are successfull, but target gcc can compile no more than "hello world"... if there are some float operations, for example, - i receive "(built-in):0 internal compiler error.... aborting" and nothing else.

p.s.: buildroot_svn + gcc4.1.2/4.2.1 + binutils2.18/latest + uclibc0.9.29/snapshot - my error
(and gcc3.... - fails to compile, saz smth. about "eabi")

maybe smb. shares config for this arch/cpu or working combination of gcc-binutils-uclibc? anyway, any suggestions/solutions are welcome, thx in advance...
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071103/181bee91/attachment.htm 
