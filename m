From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  4 Mar 2008 03:36:26 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libpng
Message-ID: <20080304113626.CB0ED12C7BA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-04 03:36:25 -0800 (Tue, 04 Mar 2008)
New Revision: 21160

Log:
libpng: select zlib package



Modified:
   trunk/buildroot/package/libpng/Config.in


Changeset:
Modified: trunk/buildroot/package/libpng/Config.in
===================================================================
--- trunk/buildroot/package/libpng/Config.in	2008-03-04 11:36:23 UTC (rev 21159)
+++ trunk/buildroot/package/libpng/Config.in	2008-03-04 11:36:25 UTC (rev 21160)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBPNG
 	bool "libpng"
 	default n
+	select BR2_PACKAGE_ZLIB
 	help
 	  Library for handling PNG (Portable Network Graphics)
 	  images.
