From: Alexander Rigbo <alexander.rigbo@acgnystrom.se>
Date: Wed, 13 Dec 2006 13:03:54 +0100
Subject: [Buildroot] Grub not working?
Message-ID: <200612131303.54803.alexander.rigbo@acgnystrom.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm making a small system for a pc/104 computer, but i'm having some troubles 
with grub.
Grub is built and installed to my root, but i can't use it to install the 
bootloader to MBR. See following output:

grub> root (hd0,1)
 Filesystem type is ext2fs, partition type 0x83
grub> setup (hd0)
 Checking if "/boot/grub/stage1" exists... no
 Checking if "/grub/stage1" exists... no

Error 15: File not found

But, on hda2 (my root partition) i have:

[root at uclibc grub]# ls -l /boot/grub/stage1
-rwxr-xr-x     1 root      root             512 Dec 13 03:25 /boot/grub/stage1

What can this be?
Grub bug? uClibc bug? buildroot? my fault (most likely though)?

Alexander
