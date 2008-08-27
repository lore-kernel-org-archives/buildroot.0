From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 27 Aug 2008 13:19:19 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fltk
Message-ID: <20080827201919.E9B3DF8006@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-27 13:19:19 -0700 (Wed, 27 Aug 2008)
New Revision: 23259

Log:
fltk: fix long help text lines

Remove comment when X isn't available while we're at it.

Modified:
   trunk/buildroot/package/fltk/Config.in


Changeset:
Modified: trunk/buildroot/package/fltk/Config.in
===================================================================
--- trunk/buildroot/package/fltk/Config.in	2008-08-27 20:19:15 UTC (rev 23258)
+++ trunk/buildroot/package/fltk/Config.in	2008-08-27 20:19:19 UTC (rev 23259)
@@ -2,9 +2,7 @@
 	bool "fltk"
 	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7
 	help
-	  a cross-platform C++ GUI toolkit for UNIX/Linux (X11), Microsoft Windows, and MacOS X.
+	  A cross-platform C++ GUI toolkit for UNIX/Linux (X11),
+	  Microsoft Windows, and MacOS X.
 
 	  http://www.fltk.org/
-
-comment "fltk		- disabled (requires Xorg(7))"
-	depends on !(BR2_PACKAGE_XORG || BR2_PACKAGE_XORG7)
