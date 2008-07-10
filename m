From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 10 Jul 2008 03:11:38 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fuse
Message-ID: <20080710101139.1B661F8010@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-10 03:11:36 -0700 (Thu, 10 Jul 2008)
New Revision: 22744

Log:
fuse: select BR2_LARGEFILE

fuse needs largefile support

Modified:
   trunk/buildroot/package/fuse/Config.in


Changeset:
Modified: trunk/buildroot/package/fuse/Config.in
===================================================================
--- trunk/buildroot/package/fuse/Config.in	2008-07-10 10:11:31 UTC (rev 22743)
+++ trunk/buildroot/package/fuse/Config.in	2008-07-10 10:11:36 UTC (rev 22744)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBFUSE
 	bool "libfuse"
 	default n
+	select BR2_LARGEFILE
 	help
 	  FUSE (Filesystem in UserSpacE)
 
