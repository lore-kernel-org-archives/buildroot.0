From: Laine Walker-Avina <lwalkera@ieee.org>
Date: Wed, 22 Apr 2009 09:08:28 -0700
Subject: [Buildroot] PXA270 and gcc-4.3.3 for iwMMXt
Message-ID: <dfb660300904220908x17502c02xad3358a6c64cb3f9@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've been trying to build a busybox system with buildroot for a
PXA270-based system. I tried to use the latest gcc version in svn to
generate the kernel and rootfs, however when I try to run the system I
can't login and it doesn't run any of the init scripts in init.d. I
tried to chroot to the new rootfs from a previously built rootfs
compiled for a armv4 arch and it gave me a "Illegal Instruction" error
when trying to run ash. Most other commands from that busybox run
fine. And ash runs fine if i don't do the chroot and use the shared
libs from the other rootfs. Any thoughts?

-Laine Walker-Avina
