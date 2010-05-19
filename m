From: Bill Borton <security@conwin.com>
Date: Wed, 19 May 2010 15:06:39 -0500
Subject: [Buildroot] Compiling host-mtd 1.3.1 error: ld: cannot find -lubi
Message-ID: <20100519150639.0062a6ae@snot.conwin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to build a jffs2 root file system.  I can not get
past this latest snag.  While compiling "host-mtd 1.3.1" it
errors out with this:

/usr/lib/gcc/i686-pc-linux-gnu/4.3.4/../../../../i686-pc-linux-gnu/bin/ld: cannot find -lubi
collect2: ld returned 1 exit status
make[2]: *** [/home/drumgod/space1/atmel_linux/buildroot/from_uclibc/5-19-10/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/mkfs.ubifs/mkfs.ubifs] Error 1
rm /home/drumgod/space1/atmel_linux/buildroot/from_uclibc/5-19-10/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/mkfs.ubifs/mkfs.ubifs.o
make[2]: Leaving directory `/home/drumgod/space1/atmel_linux/buildroot/from_uclibc/5-19-10/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/mkfs.ubifs'
make[1]: *** [subdirs_mkfs.ubifs_all] Error 2
make[1]: *** Waiting for unfinished jobs....

and ultimately this:

make[1]: Leaving directory `/home/drumgod/space1/atmel_linux/buildroot/from_uclibc/5-19-10/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1'
make: *** [/home/drumgod/space1/atmel_linux/buildroot/from_uclibc/5-19-10/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/.stamp_built] Error 2

I have tried many different configuration combinations but haven't
been able to get past this point.  Can someone please point me in
the right direction?

Thanks guys,
-Bill
