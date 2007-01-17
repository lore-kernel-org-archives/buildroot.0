From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 17 Jan 2007 05:46:47 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/cairo
Message-ID: <20070117134647.51B56485AE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-01-17 05:46:45 -0800 (Wed, 17 Jan 2007)
New Revision: 17342

Log:
s/pango/cairo/

Modified:
   trunk/buildroot/package/cairo/Config.in


Changeset:
Modified: trunk/buildroot/package/cairo/Config.in
===================================================================
--- trunk/buildroot/package/cairo/Config.in	2007-01-17 13:05:14 UTC (rev 17341)
+++ trunk/buildroot/package/cairo/Config.in	2007-01-17 13:46:45 UTC (rev 17342)
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_CAIRO
-	bool "pango"
+	bool "cairo"
 	default n
 	select BR2_PACKAGE_PKGCONFIG
 	select BR2_PACKAGE_LIBPNG
