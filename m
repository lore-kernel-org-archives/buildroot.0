From: vapier at uclibc.org <vapier@uclibc.org>
Date: Fri,  6 Oct 2006 23:28:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mtd
Message-ID: <20061007062823.841264858D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vapier
Date: 2006-10-06 23:28:23 -0700 (Fri, 06 Oct 2006)
New Revision: 16329

Log:
remove duplicate/invalid options in choice

Modified:
   trunk/buildroot/package/mtd/Config.in


Changeset:
Modified: trunk/buildroot/package/mtd/Config.in
===================================================================
--- trunk/buildroot/package/mtd/Config.in	2006-10-07 06:01:37 UTC (rev 16328)
+++ trunk/buildroot/package/mtd/Config.in	2006-10-07 06:28:23 UTC (rev 16329)
@@ -16,14 +16,11 @@
 
 config BR2_PACKAGE_MTD_ORIG
 	bool "Default source"
-	depends on BR2_PACKAGE_MTD
-	default y
 	help
 	  Use the stable release.
 
 config BR2_PACKAGE_MTD_SNAPSHOT
 	bool "Daily snapshot"
-	depends on BR2_PACKAGE_MTD
 	help
 	  Use the latest MTD daily snapshot instead of release.
 	  You should probably say NO except for specific purpose.
