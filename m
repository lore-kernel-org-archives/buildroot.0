From: Song Xiaojia <xiaojia.song12@gmail.com>
Date: Wed, 25 Sep 2019 23:51:32 -0700
Subject: [Buildroot] How to reduce the size of the rootfs with buildroot
Message-ID: <CAN6m0Dxz-KsTSR0063KmztKvx5uGfva-6vixpsjURs4sBtkxZQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
 I want to merge the linux image+file system+bootloader to one file, but my
current filesystem is too large (189MB).
I want to create a very small-size rootfs (<10MB) for my linux system on
riscv soc.
I wonder how to leverage the buildroot to achieve that?

I also feel a little confused about the initramfs and rootfs, though I did
some search. Some of the linux system booting just need initramfs, while
others need both (initramfs+rootfs).
For my case do I need both or just....

Thanks.

Best,
Sean
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190925/a8a311aa/attachment.html>
