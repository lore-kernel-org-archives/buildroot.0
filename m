From: Robin Mordasiewicz <rmordasiewicz@samuelmanutech.com>
Date: Tue, 19 Dec 2006 23:37:30 -0500 (EST)
Subject: [Buildroot] Kernel Panic .....
In-Reply-To: <Pine.LNX.4.64.0612191302220.31862@smtcorms05.samuelmanutech.com>
References: <Pine.LNX.4.64.0612191302220.31862@smtcorms05.samuelmanutech.com>
Message-ID: <Pine.LNX.4.64.0612192336370.31862@smtcorms05.samuelmanutech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 19 Dec 2006, Robin Mordasiewicz wrote:

> I am trying to boot the image as an initrd filesystem over pxe, but I see
> an error
> 'Unpacking initramfs...<0>Kernel panic - not syncing: bad gzip magic numbers'
>
> in my pxelinux.cfg/default
>
> label test
>   kernel linux-kernel-2.6.19.1-i386
>   append ramdisk_blocksize=4096 initrd=rootfs.i386.ext2 root=/dev/ram0 ramdisk_size=524288
>
> Is there anything I am required to change to make this kernel and image
> work over booting from pxe ?

I needed to build some RAM disk drivers into the kernel.
