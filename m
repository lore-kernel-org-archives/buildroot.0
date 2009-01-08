From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  8 Jan 2009 14:58:47 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mtd
Message-ID: <20090108145847.D2C1D77106@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-08 14:58:45 +0000 (Thu, 08 Jan 2009)
New Revision: 24722

Log:
mtd: mark 20050122 snapshot as deprecated

Modified:
   trunk/buildroot/package/mtd/Config.in


Changeset:
Modified: trunk/buildroot/package/mtd/Config.in
===================================================================
--- trunk/buildroot/package/mtd/Config.in	2009-01-08 13:16:24 UTC (rev 24721)
+++ trunk/buildroot/package/mtd/Config.in	2009-01-08 14:58:45 UTC (rev 24722)
@@ -25,6 +25,7 @@
 
 config BR2_PACKAGE_MTD_20050122
 	bool "Use MTD snapshot from 20050122"
+	depends on BR2_DEPRECATED
 	help
 	  Use the stable release.
 
