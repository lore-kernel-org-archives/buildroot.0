From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 26 Jan 2009 11:46:45 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20090126114645.B01F3768D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-26 11:46:44 +0000 (Mon, 26 Jan 2009)
New Revision: 25049

Log:
Fix erronous mkimage target

Modified:
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2009-01-26 10:38:00 UTC (rev 25048)
+++ trunk/buildroot/target/u-boot/Makefile.in	2009-01-26 11:46:44 UTC (rev 25049)
@@ -290,7 +290,7 @@
 #
 #############################################################
 ifeq ($(BR2_TARGET_UBOOT),y)
-TARGETS+=u-boot mkimage
+TARGETS+=u-boot
 endif
 
 u-boot-status:
