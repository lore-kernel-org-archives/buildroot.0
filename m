From: Mau Z <zmau1962@gmail.com>
Date: Sun, 12 Jan 2014 20:13:00 +0200
Subject: [Buildroot] Is there a recipe to install buildroot's output on the
	target ??
Message-ID: <CAPFcPTKRjkkc1x7ib8eNrsJbEp8mcrsfd_O1xSP0Fz0AvcxKeg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

My development system is an x86 system (running Ubuntu 12.04)
My target is also an x86 system with a SATA disk.

So, I have my ./output/image (on my development machine)
I have a bootable USB CD/disk (with Ubuntu 12.04). If we are talking about
a disk I can put on it anything.
I have syslinux on a USB disk (which requires FAT).

Now I am going to the target, I boot from the USB CD/disk.
Now what ? how to do the following steps ?

I need to create a small FAT32 partition for syslinux (10 MB should be
enough), and the rest of the disk should be an ext2 partition (3.99 GB).
Is there a recipe for this ?


Thanks
Mau
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140112/861528ff/attachment.html>
