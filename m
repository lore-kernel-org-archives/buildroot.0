From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat,  5 Jul 2008 14:57:25 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device
Message-ID: <20080705215725.EE8993C668@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-05 14:57:23 -0700 (Sat, 05 Jul 2008)
New Revision: 22657

Log:
un-deprecate gcc-4.2.1 for AVR32 external toolchain

Modified:
   trunk/buildroot/target/device/Config.in.toolchain


Changeset:
Modified: trunk/buildroot/target/device/Config.in.toolchain
===================================================================
--- trunk/buildroot/target/device/Config.in.toolchain	2008-07-05 20:29:59 UTC (rev 22656)
+++ trunk/buildroot/target/device/Config.in.toolchain	2008-07-05 21:57:23 UTC (rev 22657)
@@ -20,7 +20,6 @@
 config BR2_TOOLCHAIN_ATMEL_AVR32_4_2_1
 	bool "Use prepatched source for AVR32 gcc-4.2.1 toolchain"
 	depends on BR2_avr32
-	depends on BR2_DEPRECATED
 	select BR2_EXT_GCC_VERSION_4_2_1
 	select BR2_EXT_BINUTILS_VERSION_2_17
 	select BR2_EXT_UCLIBC_VERSION_0_9_29
