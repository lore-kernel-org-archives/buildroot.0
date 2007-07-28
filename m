From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 28 Jul 2007 09:02:08 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libid3tag
Message-ID: <20070728160208.65D1BA6044@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-28 09:02:07 -0700 (Sat, 28 Jul 2007)
New Revision: 19295

Log:
Add dependency to libmad for libid3tag

Modified:
   trunk/buildroot/package/libid3tag/Config.in


Changeset:
Modified: trunk/buildroot/package/libid3tag/Config.in
===================================================================
--- trunk/buildroot/package/libid3tag/Config.in	2007-07-28 15:57:09 UTC (rev 19294)
+++ trunk/buildroot/package/libid3tag/Config.in	2007-07-28 16:02:07 UTC (rev 19295)
@@ -2,6 +2,7 @@
 	bool "libid3tag"
 	default n
 	select BR2_PACKAGE_ZLIB
+	depends on BR2_PACKAGE_LIBMAD
 	help
 	  ID3 tag reading library from the MAD project.
 
