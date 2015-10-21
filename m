From: Lennart Ramberg <ramberg.lennart@gmail.com>
Date: Wed, 21 Oct 2015 18:59:03 +0200
Subject: [Buildroot] X11: How do I prevent the target screen from going
	black after 10 minutes?
Message-ID: <CAEzGmjCKbQKZWy0WfQaGGoqZgzJ6bjf+4jdZRinx2XLijCZ49A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Maybe not a proper Builroot question, but:
X11: How do I prevent the target screen from going black after 10 minutes?
There is no xorg.conf (to edit the ServerFlags section).
I was thinking maybe an overlay with an edited xorg.conf?

Thanks in advance
Lennart

My defconfig:
BR2_x86_i686=y
BR2_KERNEL_HEADERS_3_18=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
# BR2_TARGET_GENERIC_GETTY is not set
BR2_ROOTFS_OVERLAY="board/eta/board1/rootfs-overlay/"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_SAME_AS_HEADERS=y
BR2_LINUX_KERNEL_DEFCONFIG="i386"
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XAPP_TWM=y
BR2_PACKAGE_XAPP_XCLOCK=y
BR2_PACKAGE_XAPP_XINIT=y
BR2_PACKAGE_XAPP_XWD=y
BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD=y
BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL=y
BR2_PACKAGE_XTERM=y
BR2_PACKAGE_FLUXBOX=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_SQLITE=y
BR2_PACKAGE_LIBGTK2=y
BR2_PACKAGE_LIBCURL=y
BR2_PACKAGE_NTP=y
BR2_PACKAGE_OPENSSH=y
BR2_PACKAGE_SUPERVISOR=y
BR2_PACKAGE_NANO=y
# BR2_PACKAGE_NANO_TINY is not set
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_BLOCKS=1000000
BR2_TARGET_GRUB2=y
---
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151021/71219de5/attachment.html>
