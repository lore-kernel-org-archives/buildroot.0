From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 21 Oct 2007 13:09:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel/u-boot
Message-ID: <20071021200923.5A7FAA6083@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-21 13:09:22 -0700 (Sun, 21 Oct 2007)
New Revision: 20313

Log:
Disable AVR32 U-Boot until working

Modified:
   trunk/buildroot/target/device/Atmel/u-boot/Config.in


Changeset:
Modified: trunk/buildroot/target/device/Atmel/u-boot/Config.in
===================================================================
--- trunk/buildroot/target/device/Atmel/u-boot/Config.in	2007-10-21 18:59:58 UTC (rev 20312)
+++ trunk/buildroot/target/device/Atmel/u-boot/Config.in	2007-10-21 20:09:22 UTC (rev 20313)
@@ -1,6 +1,6 @@
 config BR2_TARGET_UBOOT
 	bool "Das U-Boot Boot Monitor"
-	depends on BR2_TARGET_AT91 || BR2_TARGET_AVR32
+	depends on BR2_TARGET_AT91
 	depends on !BR2_TARGET_AT91SAM9260PF
 	default n
 	help
