From: Michel Benoit <murpme@gmail.com>
Date: Mon, 5 Feb 2007 11:06:06 +0100
Subject: [Buildroot] Stripping module ko files
Message-ID: <c88e466f0702050206i61fc961fmf58c015a1b8c49f3@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I want to include a linux driver module .ko file in the
rootfs.arm.ext2 file that I use as the base for my root file system.

Unfortunately it seems that symbols are stripped from all files under
the buildroot/build_arm/root tree before it is packed into an ext2
file.  When I try to insmod the module, the kernel does nto find any
symbols.

Is there a simple way to exclude some files from the strip while
building an ext2 rootfs file?

Michel
