From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 27 Aug 2008 13:19:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/matchbox
Message-ID: <20080827201927.68CF5F8016@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-27 13:19:26 -0700 (Wed, 27 Aug 2008)
New Revision: 23261

Log:
matchbox: fix long help text lines

Modified:
   trunk/buildroot/package/matchbox/Config.in


Changeset:
Modified: trunk/buildroot/package/matchbox/Config.in
===================================================================
--- trunk/buildroot/package/matchbox/Config.in	2008-08-27 20:19:22 UTC (rev 23260)
+++ trunk/buildroot/package/matchbox/Config.in	2008-08-27 20:19:26 UTC (rev 23261)
@@ -6,7 +6,6 @@
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
 	help
-
 	  http://projects.o-hand.com/matchbox
 
 config BR2_PACKAGE_MATCHBOX_SNOTIFY
@@ -14,21 +13,21 @@
 	depends on BR2_PACKAGE_MATCHBOX
 	select BR2_PACKAGE_XAPP_XSM
 	help
+	  Compiles
+	  http://www.freedesktop.org/Software/startup-notification and
+	  its support in MatchBox.
 
-	  Compiles http://www.freedesktop.org/Software/startup-notification and its support in MatchBox
-
 config BR2_PACKAGE_MATCHBOX_PANEL
 	bool "Matchbox Panel"
 	depends on BR2_PACKAGE_MATCHBOX
 	help
+	  A flexible always present 'window bar' for holding
+	  application launchers.
 
-	  A flexible always present 'window bar' for holding application launchers"
-
 config BR2_PACKAGE_MATCHBOX_DESKTOP
 	bool "Matchbox Desktop"
 	depends on BR2_PACKAGE_MATCHBOX
 	help
-
 	  A PDA style application launcher or 'item browser'.
 
 config BR2_PACKAGE_MATCHBOX_KEYBOARD
@@ -36,5 +35,4 @@
 	depends on BR2_PACKAGE_MATCHBOX
 	select BR2_PACKAGE_XLIB_LIBXTST
 	help
-
 	  Virtual Keyboard (developement version from CVS)
