From: Joo Aun Saw <jasaw81@yahoo.com.au>
Date: Sun, 29 Nov 2009 22:13:39 -0800 (PST)
Subject: [Buildroot] Failed to run init
Message-ID: <156139.50263.qm@web52407.mail.re2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm using buildroot version 2009.08, target CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ).

I want to run linux from a ramdisk but it is not able to run the init file. I mounted the ramdisk on my host machine and the init file is in /sbin/init which points to ../bin/busybox. Any help would be greatly appreciated.

Important bits from Boot log:
Linux version 2.6.29 (jooaun at draco-ubuntu-vm) (gcc version 4.3.3 (GCC) )
...
Kernel command line: console=ttyS0,115200 root=/dev/ram0 initrd=0x21100000,16M init=/sbin/init
...
checking if image is initramfs...it isn't (bad gzip magic numbers); looks like an initrd
Freeing initrd memory: 16384K
...
RAMDISK: cramfs filesystem found at block 0
RAMDISK: Loading 3600KiB [1 disk] into ram disk... done.
VFS: Mounted root (cramfs filesystem) readonly on device 1:0.
Freeing init memory: 112K
Failed to execute /sbin/init.  Attempting defaults...
Kernel panic - not syncing: No init found.  Try passing init= option to kernel.



Regards,
JA


      __________________________________________________________________________________
Win 1 of 4 Sony home entertainment packs thanks to Yahoo!7.
Enter now: http://au.docs.yahoo.com/homepageset/
