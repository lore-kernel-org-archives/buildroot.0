From: <bogus@does.not.exist.com>
Date: Thu, 23 Oct 2008 17:17:48 -0000
Subject: No subject
Message-ID: <mailman.3.1225113787.1348.buildroot@uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

config BR2_TARGET_ROOTFS_EXT2_BLOCKS
        int "size in blocks (leave at 0 for auto calculation)"
        depends on BR2_TARGET_ROOTFS_EXT2
        default 0

config BR2_TARGET_ROOTFS_EXT2_INODES
        int "inodes (leave at 0 for auto calculation)"
        depends on BR2_TARGET_ROOTFS_EXT2
        default 0

 Adam> Strangely, when I mount/chroot into one of the pre-built root
 Adam> filesystems available from the uclibc website, I can create files
 Adam> without any problems.

The really old ones? They were afaik padded to 128MB.

-- 
Bye, Peter Korsgaard
