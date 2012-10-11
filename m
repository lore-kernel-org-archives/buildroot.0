From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Oct 2012 16:48:26 +0200
Subject: [Buildroot] Creating initrd
In-Reply-To: <1349964303.8392.39.camel@Homeserver>
References: <1349964303.8392.39.camel@Homeserver>
Message-ID: <20121011164826.753f8312@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Wilkinson,

On Thu, 11 Oct 2012 10:05:03 -0400, Chris Wilkinson wrote:
> I haven't been able to figure out how to get BR to create an initial
> ramdisk.
> 
> I selected initramfs in Filesystem images. What I end up with is
> 
> -rw-r--r-- 1 chrisw chrisw 38356992 Oct 11 09:00 rootfs.cpio
> -rw-r--r-- 1 chrisw chrisw 13666196 Oct 11 09:00 rootfs.cpio.gz
> -rw-r--r-- 1 chrisw chrisw 48346112 Oct 11 09:00 rootfs.ext2
> -rw-r--r-- 1 chrisw chrisw 13990321 Oct 11 09:00 rootfs.ext2.gz
> -rwxr-xr-x 1 chrisw chrisw  1422576 Oct 11 09:01 zImage
> 
> There is no initrd and the rootfs is way too big for flash.

Forget about initrd, nobody uses that anymore.

Can you post your entire .config?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
