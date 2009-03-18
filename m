From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Mar 2009 21:21:14 +0000 (UTC)
Subject: [Buildroot] svn commit: [25727] trunk/buildroot/package/pixman
Message-ID: <20090318212114.7EFB37763E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-18 21:21:14 +0000 (Wed, 18 Mar 2009)
New Revision: 25727

Log:
pixman: fixup help text indentation

Modified:
   trunk/buildroot/package/pixman/Config.in


Changeset:
Modified: trunk/buildroot/package/pixman/Config.in
===================================================================
--- trunk/buildroot/package/pixman/Config.in	2009-03-18 21:21:06 UTC (rev 25726)
+++ trunk/buildroot/package/pixman/Config.in	2009-03-18 21:21:14 UTC (rev 25727)
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PIXMAN
 	bool "pixman"
 	help
-		Cairo pixel manager
+	  Cairo pixel manager
 
-		http://cairographics.org/releases/
-
+	  http://cairographics.org/releases/
