From: correa at uclibc.org <correa@uclibc.org>
Date: Thu, 30 Apr 2009 06:27:34 +0000 (UTC)
Subject: [Buildroot] svn commit: [26248] trunk/buildroot/target/u-boot
Message-ID: <20090430062734.413E17746F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2009-04-30 06:27:33 +0000 (Thu, 30 Apr 2009)
New Revision: 26248

Log:
Undeprecate u-boot 2008.10 since this is the last version known to work with JFFS2 fs and AVR32

Modified:
   trunk/buildroot/target/u-boot/Config.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Config.in
===================================================================
--- trunk/buildroot/target/u-boot/Config.in	2009-04-29 21:25:25 UTC (rev 26247)
+++ trunk/buildroot/target/u-boot/Config.in	2009-04-30 06:27:33 UTC (rev 26248)
@@ -26,7 +26,6 @@
 
 config BR2_TARGET_UBOOT_2008_10
 	bool "u-boot-2008.10"
-	depends on BR2_DEPRECATED
 
 config BR2_TARGET_UBOOT_1_3_4
 	bool "u-boot-1.3.4"
