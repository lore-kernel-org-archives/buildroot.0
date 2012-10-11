From: Chris Wilkinson <kinsham@verizon.net>
Date: Thu, 11 Oct 2012 10:05:03 -0400
Subject: [Buildroot] Creating initrd
Message-ID: <1349964303.8392.39.camel@Homeserver>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I haven't been able to figure out how to get BR to create an initial
ramdisk.

I selected initramfs in Filesystem images. What I end up with is

-rw-r--r-- 1 chrisw chrisw 38356992 Oct 11 09:00 rootfs.cpio
-rw-r--r-- 1 chrisw chrisw 13666196 Oct 11 09:00 rootfs.cpio.gz
-rw-r--r-- 1 chrisw chrisw 48346112 Oct 11 09:00 rootfs.ext2
-rw-r--r-- 1 chrisw chrisw 13990321 Oct 11 09:00 rootfs.ext2.gz
-rwxr-xr-x 1 chrisw chrisw  1422576 Oct 11 09:01 zImage

There is no initrd and the rootfs is way too big for flash.

Chris
