From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 25 Sep 2007 14:40:04 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device
Message-ID: <20070925214004.1AB07A65A7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-25 14:40:04 -0700 (Tue, 25 Sep 2007)
New Revision: 20026

Log:
- fix whitespace


Modified:
   trunk/buildroot/target/device/Toolchain.in


Changeset:
Modified: trunk/buildroot/target/device/Toolchain.in
===================================================================
--- trunk/buildroot/target/device/Toolchain.in	2007-09-25 18:35:28 UTC (rev 20025)
+++ trunk/buildroot/target/device/Toolchain.in	2007-09-25 21:40:04 UTC (rev 20026)
@@ -1,7 +1,7 @@
 if BR2_TOOLCHAIN_EXTERNAL_SOURCE
 choice
 	prompt "Source location:"
-	default BR2_TOOLCHAIN_ATMEL_AVR32	if BR2_avr32
+	default BR2_TOOLCHAIN_ATMEL_AVR32 if BR2_avr32
 	help
 	  Select whether to use the toolchain built by the buildroot
 	  system or an external pre-built toolchain.
