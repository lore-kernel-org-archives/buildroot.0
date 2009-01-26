From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 14:04:11 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20090126140412.5620C768D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-26 14:04:10 +0000 (Mon, 26 Jan 2009)
New Revision: 25050

Log:
u-boot: mark 2008.10 version as recent

Modified:
   trunk/buildroot/target/u-boot/Config.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Config.in
===================================================================
--- trunk/buildroot/target/u-boot/Config.in	2009-01-26 11:46:44 UTC (rev 25049)
+++ trunk/buildroot/target/u-boot/Config.in	2009-01-26 14:04:10 UTC (rev 25050)
@@ -22,6 +22,7 @@
 
 config BR2_TARGET_UBOOT_2008_10
 	bool "u-boot-2008.10"
+	depends on BR2_DEPRECATED || BR2_RECENT
 
 config BR2_TARGET_UBOOT_1_3_4
 	bool "u-boot-1.3.4"
