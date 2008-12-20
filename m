From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 20 Dec 2008 22:19:39 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/arch-avr32:
	kernel-patches-2.6.27.6
Message-ID: <20081220221939.4935476CEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-12-20 22:19:38 +0000 (Sat, 20 Dec 2008)
New Revision: 24469

Log:
Add 2.6.27.7 patches for AVR32

Added:
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.27.6/
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.27.6/linux-2.6.27.6-100-avr32-atmel.1.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.27.6/linux-2.6.27.6-200-avr32-remove.note.gnu.build-id-section.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.27.6/linux-2.6.27.6-201-avr32-atmel_mpopfb-disable-debug.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.27.6/linux-2.6.27.6-202-avr32-atmel_mpopfb-add-signal-to-disable-line-caching.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.27.6/linux-2.6.27.6-203-avr32-fix-arch-header-byteorder.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.27.6/linux-2.6.27.6-204-avr32-ap700x-fix-det_pin-for-nand-flash.patch

Modified:
   trunk/buildroot/target/device/Atmel/arch-avr32/Config.in.linux.patches


Changeset:

Sorry, the patch is too large to include (27029 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=24469
