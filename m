From: Kevin Tomary <kevin.tomary@hotmail.com>
Date: Wed, 25 Nov 2020 21:09:48 +0000
Subject: [Buildroot] part rootfs size (268435456) too small for rootfs.ext4
 (283115520)
Message-ID: <AM9PR10MB4563BD0E8F2DCD86C358D08482FA0@AM9PR10MB4563.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

I have a problem. I wanted to update my build with adding some packages for my embedded system(stm32mp157)

In menuconfig --> Filesystem images I chose an exact size of 270M which generated the above error.

I tested the exact size and I for


  *   exact file size <265 :mkfs.ext4: Could not allocate block in ext2 filesystem while populating file system
*** Maybe you need to increase the filesystem size (BR2_TARGET_ROOTFS_EXT2_SIZE)
fs/ext2/ext2.mk:46: recipe for target '/home/mehdi/buildroot/output/images/rootfs.ext2' failed


  *   exact file size superior or equal to 265 I got : part rootfs size (268435456) too small for rootfs.ext4 (283115520)

What should I do? I am beginning my project and I may need further packages and modules for what is coming.

What should I do?


Best Regards

Kevin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201125/940f5288/attachment.html>
