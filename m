From: Lennart Ramberg <ramberg.lennart@gmail.com>
Date: Mon, 24 Nov 2014 13:41:38 +0100
Subject: [Buildroot] Need help getting started with X11
Message-ID: <CAEzGmjByqb2QB4+-QDOcJYDo6zvD+UpkG9kaNmBzBHKMFaGDJg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I need help getting started with X11.
Is there any Buildroot tutorial about this?

Or, if anyone would be so kind, I'm stuck at the below defconfig.
The system works in the sense that I can ssh into it, but now I want
graphics on the console display.
I have not yet anything in the overlays that starts or otherwise relates to
xorg.
My target chipset is Intel 852GM.
For one thing, what is supposed to create an xorg.conf?
And I suppose X should be started somehow in supervisor.d like I start sshd
there.

BR2_x86_i686=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
# BR2_TARGET_GENERIC_GETTY is not set
BR2_ROOTFS_OVERLAY="board/eta/board1/rootfs-overlay/"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_DEFCONFIG="i386"
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XAPP_TWM=y
BR2_PACKAGE_XAPP_XINIT=y
BR2_PACKAGE_XAPP_XWD=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_SQLITE=y
BR2_PACKAGE_CAIRO=y
BR2_PACKAGE_LIBCURL=y
BR2_PACKAGE_NTP=y
BR2_PACKAGE_OPENSSH=y
BR2_PACKAGE_SUPERVISOR=y
BR2_PACKAGE_NANO=y
# BR2_PACKAGE_NANO_TINY is not set
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_BLOCKS=1000000
BR2_TARGET_GRUB2=y

Regards
Lennart
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141124/a62dfc6d/attachment.html>
