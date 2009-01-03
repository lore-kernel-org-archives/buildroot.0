From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat,  3 Jan 2009 00:40:03 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/at91sam9260dfc
Message-ID: <20090103004004.33E8F769FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-03 00:40:02 +0000 (Sat, 03 Jan 2009)
New Revision: 24660

Log:
Fix remaining 'butterfinger' issue

Modified:
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/Makefile.in


Changeset:
Modified: trunk/buildroot/target/device/Atmel/at91sam9260dfc/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9260dfc/Makefile.in	2009-01-03 00:07:25 UTC (rev 24659)
+++ trunk/buildroot/target/device/Atmel/at91sam9260dfc/Makefile.in	2009-01-03 00:40:02 UTC (rev 24660)
@@ -14,3 +14,5 @@
 UBOOT_BOARD_NAME:=at91sam9260ek_nandflash
 endif
 
+endif
+
