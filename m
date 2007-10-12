From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 12 Oct 2007 08:10:28 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot:
	target/device/Atmel/arch-avr32 target/de etc...
Message-ID: <20071012151028.34477A65CB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-12 08:10:27 -0700 (Fri, 12 Oct 2007)
New Revision: 20231

Log:
Add 2.6.22.10 and 2.6.23 support

Added:
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.22.10/
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.22.10/linux-2.6.22.10-100-avr32-atmel.4.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.22.10/linux-2.6.22.10-500-gpio_mouse-setup-for-atstk1000-board.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.22.10/linux-2.6.22.10-501-atmel_mci-minor-fixes-and-cleanups.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.22.10/linux-2.6.22.10-502-atmel_mci-fix-two-subtle-but-deadly-races.patch
   trunk/buildroot/target/device/Atmel/atngw100/atngw100-linux-2.6.22.10.config
   trunk/buildroot/target/device/Atmel/atstk1002/atstk1002-linux-2.6.22.10.config

Modified:
   trunk/buildroot/target/linux/Config.in
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:

Sorry, the patch is too large to include (20255 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=20231
