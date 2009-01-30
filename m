From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 30 Jan 2009 18:39:08 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot: target/device/Atmel
	target/device/Atmel/ etc...
Message-ID: <20090130183909.05D727620E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-30 18:39:03 +0000 (Fri, 30 Jan 2009)
New Revision: 25171

Log:
Remove AVR32 patches from kernel-headers directory and put them in 

"target/device/Atmel/arch-avre/kernel-headers-2.6.28.2"

Make sure BR2_KERNEL_HEADERS_PATCH_DIR is enabled for 2.6.28
Set
KERNEL_HEADERS_PATCH_DIR="target/device/Atmel/arch-avre/kernel-headers-2.6.28.2"
for Atmel AVR32 targets and "valka"



Added:
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-headers-2.6.28.2/
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-headers-2.6.28.2/linux-2.6.28.2-100-avr32.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-headers-2.6.28.2/linux-2.6.28.2-201-avr32-atmel_mpopfb-disable-debug.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-headers-2.6.28.2/linux-2.6.28.2-202-avr32-atmel_mpopfb-add-signal-to-disable-line-caching.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-headers-2.6.28.2/linux-2.6.28.2-203-avr32-fix-arch-header-byteorder.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-headers-2.6.28.2/linux-2.6.28.2-204-avr32-ap700x-fix-det_pin-for-nand-flash.patch

Removed:
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-100-avr32.patch
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-201-avr32-atmel_mpopfb-disable-debug.patch
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-202-avr32-atmel_mpopfb-add-signal-to-disable-line-caching.patch
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-203-avr32-fix-arch-header-byteorder.patch
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-204-avr32-ap700x-fix-det_pin-for-nand-flash.patch

Modified:
   trunk/buildroot/target/device/Atmel/Makefile.in
   trunk/buildroot/target/device/valka/Makefile.in
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:

Sorry, the patch is too large to include (34026 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=25171
