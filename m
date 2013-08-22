From: Assaf Inbal <shmuelzon@gmail.com>
Date: Thu, 22 Aug 2013 08:09:25 +0300
Subject: [Buildroot] initrd isn't needed for iso9660 when initramfs is used
Message-ID: <1377148166-21030-1-git-send-email-shmuelzon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm not entirely sure of this patch.
The problem is that, while initrd isn't needed when initramfs is used, the
default menu for grub always includes the initrd directive and will fail to load
when it's missing.
Perhaps we should have two grub menus? Or create it during build?
Any ideas?

Thanks,
Assaf
