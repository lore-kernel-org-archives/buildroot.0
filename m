From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 30 Jan 2009 08:53:10 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot:
	target/device/Atmel/arch-avr32/kernel-pa etc...
Message-ID: <20090130085310.9730F765E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-30 08:53:08 +0000 (Fri, 30 Jan 2009)
New Revision: 25157

Log:
Move AVR32 patch to kernel header to unbreak several applications

Added:
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-100-avr32.patch
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-201-avr32-atmel_mpopfb-disable-debug.patch
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-202-avr32-atmel_mpopfb-add-signal-to-disable-line-caching.patch
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-203-avr32-fix-arch-header-byteorder.patch
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-204-avr32-ap700x-fix-det_pin-for-nand-flash.patch

Removed:
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.28.2/linux-2.6.28.2-100-avr32-atmel.1.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.28.2/linux-2.6.28.2-201-avr32-atmel_mpopfb-disable-debug.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.28.2/linux-2.6.28.2-202-avr32-atmel_mpopfb-add-signal-to-disable-line-caching.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.28.2/linux-2.6.28.2-203-avr32-fix-arch-header-byteorder.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.28.2/linux-2.6.28.2-204-avr32-ap700x-fix-det_pin-for-nand-flash.patch


Changeset:

Sorry, the patch is too large to include (33953 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=25157
