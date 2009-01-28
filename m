From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Wed, 28 Jan 2009 13:16:27 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/xfsprogs
Message-ID: <20090128131627.E15DB769CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2009-01-28 13:16:27 +0000 (Wed, 28 Jan 2009)
New Revision: 25091

Log:
xfs is a mainline filesystem with no alternative regarding tools in busybox, remove depend on deprecated


Modified:
   trunk/buildroot/package/xfsprogs/Config.in


Changeset:
Modified: trunk/buildroot/package/xfsprogs/Config.in
===================================================================
--- trunk/buildroot/package/xfsprogs/Config.in	2009-01-28 13:14:51 UTC (rev 25090)
+++ trunk/buildroot/package/xfsprogs/Config.in	2009-01-28 13:16:27 UTC (rev 25091)
@@ -4,7 +4,6 @@
 
 config BR2_PACKAGE_XFSPROGS
 	bool "xfsprogs"
-	depends on BR2_DEPRECATED
 	help
 	  The XFS file system utilities and libraries
 
