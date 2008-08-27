From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 27 Aug 2008 13:19:37 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gqview
Message-ID: <20080827201937.BA5CFF8023@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-27 13:19:37 -0700 (Wed, 27 Aug 2008)
New Revision: 23264

Log:
gqview: fix long help text lines

Modified:
   trunk/buildroot/package/gqview/Config.in


Changeset:
Modified: trunk/buildroot/package/gqview/Config.in
===================================================================
--- trunk/buildroot/package/gqview/Config.in	2008-08-27 20:19:34 UTC (rev 23263)
+++ trunk/buildroot/package/gqview/Config.in	2008-08-27 20:19:37 UTC (rev 23264)
@@ -2,6 +2,6 @@
 	bool "gqview"
 	select BR2_PACKAGE_PKGCONFIG
 	help
-	  GQview is an image viewer for Unix operating systems (developed on Linux).
+	  GQview is an image viewer for Unix operating systems
 
 	  http://prdownloads.sourceforge.net/gqview
