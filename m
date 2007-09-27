From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 27 Sep 2007 14:18:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mtd
Message-ID: <20070927211800.D6D12A603D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-27 14:17:58 -0700 (Thu, 27 Sep 2007)
New Revision: 20070

Log:
Remove superfluose defaults

Modified:
   trunk/buildroot/package/mtd/Config.in


Changeset:
Modified: trunk/buildroot/package/mtd/Config.in
===================================================================
--- trunk/buildroot/package/mtd/Config.in	2007-09-27 20:49:57 UTC (rev 20069)
+++ trunk/buildroot/package/mtd/Config.in	2007-09-27 21:17:58 UTC (rev 20070)
@@ -15,14 +15,12 @@
 	bool "Use MTD-utils"
 	depends on BR2_PACKAGE_MTD
 	select BR2_PACKAGE_LZO
-	default n
 	help
 	  Build mtd/jffs utilities with Dataflash support
 
 config BR2_PACKAGE_MTD_20061007
 	bool "Use MTD from (20061007)"
 	depends on BR2_PACKAGE_MTD
-	default n
 	help
 	  Build mtd/jffs utilities with Dataflash support
 
