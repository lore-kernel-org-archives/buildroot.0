From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 17 Dec 2010 17:00:18 +0100
Subject: [Buildroot] [git commit master 1/1] board: remove
	i386/i686_defconfig
Message-ID: <20101217160200.F38CC8E9A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=de952581367f2029e0f28c1897d0e79326bd835f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Those are not associated with any specific hardware system (PC or
another i386 system). Moreover, the fact that those configurations
require the build of a JFFS2 filesystem, very uncommon on PC systems,
seems to indicate that those configurations are not really being used
today.

It would make more sense to have a qemu_i388_defconfig (building a
kernel with just the device drivers for Qemu) and possibly a
pc_i386_defconfig (building a kernel with many device drivers, and a
bootloader such as Grub or Grub 2).

We also remove the corresponding kernel configuration files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

Patch is too large, so refusing to show it
