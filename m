From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 29 Jan 2009 09:32:46 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/arch-avr32:
	kernel-patches-2.6.28.2
Message-ID: <20090129093246.EBDF27741D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-29 09:32:45 +0000 (Thu, 29 Jan 2009)
New Revision: 25113

Log:
Add AVR32 support for linux-2.6.28.2

Added:
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.28.2/
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.28.2/linux-2.6.28.2-100-avr32-atmel.1.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.28.2/linux-2.6.28.2-201-avr32-atmel_mpopfb-disable-debug.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.28.2/linux-2.6.28.2-202-avr32-atmel_mpopfb-add-signal-to-disable-line-caching.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.28.2/linux-2.6.28.2-203-avr32-fix-arch-header-byteorder.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.28.2/linux-2.6.28.2-204-avr32-ap700x-fix-det_pin-for-nand-flash.patch

Removed:
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.20.4/
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.21.5/
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.22.1/
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.22.10/
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.23/
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.24/
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.25.10/

Modified:
   trunk/buildroot/target/device/Atmel/arch-avr32/Config.in.linux.patches


Changeset:

Sorry, the patch is too large to include (17059 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=25113
