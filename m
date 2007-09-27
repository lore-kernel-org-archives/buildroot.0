From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 27 Sep 2007 00:38:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mtd
Message-ID: <20070927073810.BE6CEA4D1C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-27 00:38:09 -0700 (Thu, 27 Sep 2007)
New Revision: 20056

Log:
mtd-utils require lzo

Modified:
   trunk/buildroot/package/mtd/Config.in


Changeset:
Modified: trunk/buildroot/package/mtd/Config.in
===================================================================
--- trunk/buildroot/package/mtd/Config.in	2007-09-27 07:36:42 UTC (rev 20055)
+++ trunk/buildroot/package/mtd/Config.in	2007-09-27 07:38:09 UTC (rev 20056)
@@ -14,6 +14,7 @@
 config BR2_PACKAGE_MTD_UTILS
 	bool "Use MTD-utils"
 	depends on BR2_PACKAGE_MTD
+	select BR2_PACKAGE_LZO
 	default n
 	help
 	  Build mtd/jffs utilities with Dataflash support
