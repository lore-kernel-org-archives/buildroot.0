From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 29 Jan 2009 20:51:07 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel:
	arch-avr32 atngw100 atstk1005 atstk100x
Message-ID: <20090129205107.9ED3A7741D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-29 20:51:05 +0000 (Thu, 29 Jan 2009)
New Revision: 25137

Log:
Clean up AVR32 Linux support for atngw100, atstk100x and atstk1005
The boards now support 2.6.27.13 as default
There are configs for 2.6.28.2, but this patch is marked (experimental)
Configuration options for no longer existing patches are removed
(AC-97,ISI and PS2-I/F)



Added:
   trunk/buildroot/target/device/Atmel/atngw100/atngw100-linux-2.6.27.13.config
   trunk/buildroot/target/device/Atmel/atngw100/atngw100-linux-2.6.28.2.config
   trunk/buildroot/target/device/Atmel/atstk1005/atstk1005-linux-2.6.27.13.config
   trunk/buildroot/target/device/Atmel/atstk1005/atstk1005-linux-2.6.28.2.config
   trunk/buildroot/target/device/Atmel/atstk100x/atstk100x-linux-2.6.27.13.config
   trunk/buildroot/target/device/Atmel/atstk100x/atstk100x-linux-2.6.28.2.config

Removed:
   trunk/buildroot/target/device/Atmel/atngw100/atngw100-linux-2.6.22.1.config
   trunk/buildroot/target/device/Atmel/atngw100/atngw100-linux-2.6.23.config
   trunk/buildroot/target/device/Atmel/atngw100/atngw100-linux-2.6.27.10.config
   trunk/buildroot/target/device/Atmel/atstk1005/atstk1005-linux-2.6.27.6.config
   trunk/buildroot/target/device/Atmel/atstk100x/atstk1002-linux-2.6.22.1.config
   trunk/buildroot/target/device/Atmel/atstk100x/atstk1002-linux-2.6.22.10.config
   trunk/buildroot/target/device/Atmel/atstk100x/atstk1002-linux-2.6.23.config
   trunk/buildroot/target/device/Atmel/atstk100x/atstk1002-linux-2.6.24.config
   trunk/buildroot/target/device/Atmel/atstk100x/atstk1002-no-mplayer_defconfig
   trunk/buildroot/target/device/Atmel/atstk100x/atstk100x-linux-2.6.27.10.config
   trunk/buildroot/target/device/Atmel/atstk100x/atstk100x-linux-2.6.27.12.config
   trunk/buildroot/target/device/Atmel/atstk100x/atstk100x-linux-2.6.27.3.config

Modified:
   trunk/buildroot/target/device/Atmel/arch-avr32/Config.in.linux.patches
   trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
   trunk/buildroot/target/device/Atmel/atstk1005/atstk1005_defconfig
   trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig
   trunk/buildroot/target/device/Atmel/uClibc.config.avr32


Changeset:

Sorry, the patch is too large to include (23364 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=25137
