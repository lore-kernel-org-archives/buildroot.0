From: Thomas <tokant@gmx.net>
Date: Sat, 06 Mar 2010 07:19:20 +0100
Subject: [Buildroot] Error in 'e2fsprogs 1.41.9 Post installing'
Message-ID: <1267856360.13606.11.camel@bernd-desktop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I tried the latest buildroot-2010.02:
make at91rm9200df_defconfig
make menuconfig
make

buildroot terminates with:

make: ***
[/media/disk/br1002/buildroot-2010.02/output/build/e2fsprogs-1.41.9/.stamp_hook_post_install] Error 1

Earlier in the console window, I found:

/media/disk/br1002/buildroot-2010.02/output/staging/usr/bin/ldconfig:
can't link /usr/lib/libgnuintl.so.8 to preloadable_libintl.so:
Permission denied
/media/disk/br1002/buildroot-2010.02/output/staging/usr/bin/ldconfig:
skipping /usr/X11R6/lib: No such file or directory

My host system is Ubuntu 8.04/32 Bit. buildroot-2009.05 runs fine.

Thanks, Thomas.
