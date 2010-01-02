From: Nicolae T <microvis@cox.net>
Date: Fri, 01 Jan 2010 18:12:57 -0800
Subject: [Buildroot] uClibc-0.9.30.1 build missing file
Message-ID: <1262398377.4627.13.camel@RoadRunner>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello and Happy New Year to all, 

It appears uClibc build misses an archive file. It occurs on more than
one snapshot.
Does anybody run into it? Is there a fix to it?
Thanks.

make[1]: Entering directory
`/home/nicolae/buildroot/output/toolchain/uClibc-0.9.30.1'
  GEN include/bits/sysnum.h
  AS lib/crt1.o
  AS lib/Scrt1.o
  AS lib/crti.o
  AS lib/crtn.o
  CC ldso/ldso/ldso.oS
  AS ldso/ldso/arm/resolve.oS
  AR cr ldso/ldso/ld-uClibc_so.a
  STRIP -x -R .note -R .comment ldso/ldso/ld-uClibc_so.a
  LD ld-uClibc-0.9.30.1.so
arm-linux-uclibcgnueabi-gcc: libgcc.a: No such file or directory
make[1]: *** [lib/ld-uClibc.so] Error 1
make[1]: Leaving directory
`/home/nicolae/buildroot/output/toolchain/uClibc-0.9.30.1'
make: ***
[/home/nicolae/buildroot/output/toolchain/uClibc-0.9.30.1/lib/libc.a]
Error 2

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100101/d31cbd68/attachment.htm>
