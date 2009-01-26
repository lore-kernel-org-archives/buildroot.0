From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 26 Jan 2009 00:14:56 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libfloat
Message-ID: <20090126001456.F340176D28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-26 00:14:56 +0000 (Mon, 26 Jan 2009)
New Revision: 25039

Log:
deprecate libfloat, package is obsolete

Modified:
   trunk/buildroot/package/libfloat/Config.in


Changeset:
Modified: trunk/buildroot/package/libfloat/Config.in
===================================================================
--- trunk/buildroot/package/libfloat/Config.in	2009-01-26 00:14:19 UTC (rev 25038)
+++ trunk/buildroot/package/libfloat/Config.in	2009-01-26 00:14:56 UTC (rev 25039)
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBFLOAT
 	bool "libfloat"
+	depends on BR2_DEPRECATED
 	help
 	 Soft floating point library.
 	
