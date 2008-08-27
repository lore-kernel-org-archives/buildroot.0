From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 27 Aug 2008 13:19:30 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/blackbox
Message-ID: <20080827201930.B05ADF8021@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-27 13:19:30 -0700 (Wed, 27 Aug 2008)
New Revision: 23262

Log:
blackbox: fix long help text lines

Modified:
   trunk/buildroot/package/blackbox/Config.in


Changeset:
Modified: trunk/buildroot/package/blackbox/Config.in
===================================================================
--- trunk/buildroot/package/blackbox/Config.in	2008-08-27 20:19:26 UTC (rev 23261)
+++ trunk/buildroot/package/blackbox/Config.in	2008-08-27 20:19:30 UTC (rev 23262)
@@ -2,6 +2,7 @@
 	bool "blackbox"
 	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7
 	help
-	  Blackbox is a fast, lightweight window manager for the X Window System.
+	  Blackbox is a fast, lightweight window manager for the X
+	  Window System.
 
 	  http://blackboxwm.sourceforge.net/
