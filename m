From: kannappan at tesbv.com <kannappan@tesbv.com>
Date: Fri, 07 Sep 2007 23:47:13 +0530
Subject: [Buildroot] booting fails after "init free memory"
Message-ID: <20070907234713.w9dhgswl4wkc0s8w@bangalore.tesbv.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am using buildroot / uclibc to make initrd image.

uclibc version is 0.9.29 ,  binutils 2.17, gcc 4.1.2 and busybox  
version 1.6.1.

buildroot and busybox is compiled with shared lib options.

when i load the initrd image to the target (arm926ejs), i am getting  
the following message:

RAMDISK: Compressed image found at block 0
VFS: Mounted root (ext2 filesystem)
Freeing init memory: 72K

when i google'd for this freeze operation, lists opted to enable the  
NWFPE in the kernel.  even after that there is a freeze.

with gcc4.1.2, binutils 2.17, newlib and busybox 1.6.1, after enabling  
NWFPE in kernel, initrd works fine.

can anyone throw some pointers ?
--
kans.

----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
