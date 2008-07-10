From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 10 Jul 2008 03:11:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fuse
Message-ID: <20080710101127.EA4AFF8006@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-10 03:11:25 -0700 (Thu, 10 Jul 2008)
New Revision: 22742

Log:
fuse: use tabs for indentation in kconfig

Modified:
   trunk/buildroot/package/fuse/Config.in


Changeset:
Modified: trunk/buildroot/package/fuse/Config.in
===================================================================
--- trunk/buildroot/package/fuse/Config.in	2008-07-10 08:55:40 UTC (rev 22741)
+++ trunk/buildroot/package/fuse/Config.in	2008-07-10 10:11:25 UTC (rev 22742)
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBFUSE
-        bool "libfuse"
-        default n
-        help
+	bool "libfuse"
+	default n
+	help
 	  FUSE (Filesystem in UserSpacE)
 
 	  http://fuse.sourceforge.net/
