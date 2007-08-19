From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 19 Aug 2007 15:43:52 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel:
	arch-avr32 arch-avr32/kernel-patches-2.6 etc...
Message-ID: <20070819224352.2AA20A610F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-19 15:43:50 -0700 (Sun, 19 Aug 2007)
New Revision: 19580

Log:
Delete avr32 specific patch and introduced merged at91/avr32 patch

Added:
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.20.4/
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.21.5/
   trunk/buildroot/target/device/Atmel/linux/kernel-patches-2.6.22.1/
   trunk/buildroot/target/device/Atmel/linux/kernel-patches-2.6.22.1/linux-2.6.22.1-001-at91+avr32.patch
   trunk/buildroot/target/device/Atmel/linux/kernel-patches-2.6.22.1/linux-2.6.22.1-005-atags-support.patch

Removed:
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.22.1/linux-2.6.22.1-003-atmel.3-avr32-updates.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.22.1/linux-2.6.22.1-008-atmel-gpio_mouse-setup-for-atstk1000-board.patch


Changeset:

Sorry, the patch is too large to include (39670 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=19580
