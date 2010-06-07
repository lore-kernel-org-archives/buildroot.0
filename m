From: Marcus Tangermann <marcus.tangermann@gmail.com>
Date: Mon, 7 Jun 2010 18:41:29 +0200
Subject: [Buildroot] buildroot for Freescale P2020RDB board
Message-ID: <AANLkTilZluCVpvJzNT8FhStCyABMxOtL_Sh_RC9d_Ibh@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I try to get a working kernel and image for a Freescale PowerPC P2 based
board P2020RDB using buildroot 2010.05.
In menuconfig I've chosen a PowerPC generic architecture with uClibc 0.9.30
and gcc 4.4.4.
The compiled images (kernel and ext2 rootfs) don't work. After loading them
via tftp and u-boot, the machine simply stops (=crashes).
To test the rootfs I've manually compiled a kernel using the Freescale
toolchain. The kernel works but the rootfs crashes the machine after
loading.
So I guess there is something fundamental wrong ;-)

So, I would be glad if someone has some hints regarding my problem:
1. Is it possible to generate a working image for an P2020RDB or are there
problems with the e500v2 core?
2. Is it possible to integrate the external toolchain from Freescale
(gcc-4.3.74-eglibc-2.8.74-dp-2) ? The toolchain type seems to fit neither
glibc nor eglibc style.

Thanks!
Marcus
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100607/4921f961/attachment.html>
