From: Willy <willy@willygroup.org>
Date: Thu, 01 Mar 2012 17:06:44 +0100
Subject: [Buildroot] Using buildroot images (iso/ext2) in real target device
	(flash drive)
Message-ID: <jio6ql$25v$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I have created my system images (iso and ext2) and I would put one of 
them in the flash drive of the target system.

So far I've used unetbootin to create a bootable system which loaded in 
RAM, now the image is too big for my RAM.

Now I've used dd to put my image in the flash drive:
sudo dd if=rootfs.ext2 of=/dev/sdc1

Then when the machine starts I got the error:

Missing operating system
DISK BOOT FAILURE, PLEASE INSERT...

I "think" I've installed grub on my buildroot image
( package BR2_TARGET_GRUB [=y] ).
How can I test if grub is properly installed and how can I setup it?
Thanks,
-- 
Willy
