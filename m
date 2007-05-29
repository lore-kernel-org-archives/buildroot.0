From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 29 May 2007 07:55:28 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libid3tag
Message-ID: <20070529145528.5920E48573@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-05-29 07:55:27 -0700 (Tue, 29 May 2007)
New Revision: 18700

Log:
libid3tag requires zlib. Noticed by Stuart Wood

Modified:
   trunk/buildroot/package/libid3tag/Config.in


Changeset:
Modified: trunk/buildroot/package/libid3tag/Config.in
===================================================================
--- trunk/buildroot/package/libid3tag/Config.in	2007-05-27 22:03:58 UTC (rev 18699)
+++ trunk/buildroot/package/libid3tag/Config.in	2007-05-29 14:55:27 UTC (rev 18700)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBID3TAG
 	bool "libid3tag"
 	default n
+	select BR2_PACKAGE_ZLIB
 	help
 	  ID3 tag reading library from the MAD project.
 
