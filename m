From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 21:10:13 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/arch-avr32:
	kernel-patches-2.6.20.4 kernel-patches-2 etc...
Message-ID: <20090126211013.2FAB27672B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-26 21:10:11 +0000 (Mon, 26 Jan 2009)
New Revision: 25069

Log:
target/device/Atmel/arch-avr32: remove old unused kernel patches

As discussed on the list:

22:08 < HcE> Jacmet: so yes, AVR32 wise you can delete anything older than
             2.6.27

Removed:
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.20.4/.empty
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.21.5/.empty
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.22.1/.empty
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.22.10/linux-2.6.22.10-100-avr32-atmel.4.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.22.10/linux-2.6.22.10-500-gpio_mouse-setup-for-atstk1000-board.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.22.10/linux-2.6.22.10-501-atmel_mci-minor-fixes-and-cleanups.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.22.10/linux-2.6.22.10-502-atmel_mci-fix-two-subtle-but-deadly-races.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.23/linux-2.6.23-100-avr32-atmel.2.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.23/linux-2.6.23-200-fix-include-typo-for-atngw100-board.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.24/linux-2.6.24-100-avr32-git.1.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.24/linux-2.6.24-500-v4l-avr32-isi.patch.cond
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.24/linux-2.6.24-600-avr32-mmc.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.24/linux-2.6.24-avr32-ac97-reset.patch.cond
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.24/linux-2.6.24-avr32-psif-2.patch.cond
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.25.10/linux-2.6.25.10-no-localversion.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.25.10/linux-2.6.25.10.atmel.2.patch.bz2


Changeset:

Sorry, the patch is too large to include (58852 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=25069
