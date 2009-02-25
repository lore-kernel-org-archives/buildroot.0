From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 25 Feb 2009 14:28:50 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target:
	device/Atmel/arch-avr32/kernel-headers-2 etc...
Message-ID: <20090225142850.F20E17669C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-25 14:28:49 +0000 (Wed, 25 Feb 2009)
New Revision: 25454

Log:
avr32: rename 2.6.28.x kernel patches to match current kernel headers version

Added:
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-headers-2.6.28.2/linux-2.6.28.7-100-avr32.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-headers-2.6.28.2/linux-2.6.28.7-201-avr32-atmel_mpopfb-disable-debug.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-headers-2.6.28.2/linux-2.6.28.7-202-avr32-atmel_mpopfb-add-signal-to-disable-line-caching.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-headers-2.6.28.2/linux-2.6.28.7-203-avr32-fix-arch-header-byteorder.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-headers-2.6.28.2/linux-2.6.28.7-204-avr32-ap700x-fix-det_pin-for-nand-flash.patch

Removed:
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-headers-2.6.28.2/linux-2.6.28.2-100-avr32.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-headers-2.6.28.2/linux-2.6.28.2-201-avr32-atmel_mpopfb-disable-debug.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-headers-2.6.28.2/linux-2.6.28.2-202-avr32-atmel_mpopfb-add-signal-to-disable-line-caching.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-headers-2.6.28.2/linux-2.6.28.2-203-avr32-fix-arch-header-byteorder.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-headers-2.6.28.2/linux-2.6.28.2-204-avr32-ap700x-fix-det_pin-for-nand-flash.patch

Modified:
   trunk/buildroot/target/linux/Config.in.versions


Changeset:

Sorry, the patch is too large to include (33974 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=25454
