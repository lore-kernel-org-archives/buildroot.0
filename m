From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 31 Jul 2007 08:39:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device
Message-ID: <20070731153923.7B9BDA4940@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-31 08:39:23 -0700 (Tue, 31 Jul 2007)
New Revision: 19356

Log:
- fixup whitespace


Modified:
   trunk/buildroot/target/device/Toolchain.in


Changeset:
Modified: trunk/buildroot/target/device/Toolchain.in
===================================================================
--- trunk/buildroot/target/device/Toolchain.in	2007-07-31 15:37:53 UTC (rev 19355)
+++ trunk/buildroot/target/device/Toolchain.in	2007-07-31 15:39:23 UTC (rev 19356)
@@ -1,7 +1,7 @@
 choice
 	prompt "Source location:"
-	default BR2_TOOLCHAIN_NORMAL		if	!BR2_avr32
-	default BR2_TOOLCHAIN_ATMEL_AVR32	if	 BR2_avr32
+	default BR2_TOOLCHAIN_NORMAL		if!BR2_avr32
+	default BR2_TOOLCHAIN_ATMEL_AVR32	if BR2_avr32
 	depends on BR2_TOOLCHAIN_BUILDROOT
 	help
 	  Select whether to use the toolchain built by the buildroot
