From: David Sanchez Herrero <david.krusty@gmail.com>
Date: Mon, 10 Sep 2012 15:01:05 +0200
Subject: [Buildroot] Uncompressed kernel image for ARM architecture
	(Raspberry)
Message-ID: <CAMPeO9yjDwyhqpA0nOwLcp25cponBsP_OC_J4T7+22Jj_OzoaA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Is there a way to obtain uncompressed kernel image for ARM architecture?

I'm trying to build a kernel and a root filesystem for Raspberry Pi from an
internal buildroot toolchain with uClibc, but the only supported formats
for the output kernel image are vmlinux, uImage and zImage.

Downloading the kernel sources from the Raspberry Git repositories, and
building them manually, an image file called "Image" is generated under
".arch/arm/boot/" folder, but this file doesn't exists if the building
process of the same sources is made by Buildroot.

Maybe using BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM?

Thanks in advance.

Greeting, David.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120910/672b23ad/attachment.html>
