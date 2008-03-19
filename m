From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 19 Mar 2008 00:26:34 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device
Message-ID: <20080319144044.2C00A12CF13@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-03-19 00:26:34 -0700 (Wed, 19 Mar 2008)
New Revision: 21398

Log:
Fix AVR32 ext toolchain

Modified:
   trunk/buildroot/target/device/Config.in.toolchain


Changeset:
Modified: trunk/buildroot/target/device/Config.in.toolchain
===================================================================
--- trunk/buildroot/target/device/Config.in.toolchain	2008-03-19 05:00:05 UTC (rev 21397)
+++ trunk/buildroot/target/device/Config.in.toolchain	2008-03-19 07:26:34 UTC (rev 21398)
@@ -1,7 +1,7 @@
 if BR2_TOOLCHAIN_EXTERNAL_SOURCE
 choice
 	prompt "Source location:"
-	default BR2_TOOLCHAIN_ATMEL_AVR32 if BR2_avr32
+	default BR2_TOOLCHAIN_ATMEL_AVR32_4_2_1 if BR2_avr32
 	help
 	  Select whether to use the toolchain built by the buildroot
 	  system or an external pre-built toolchain.
