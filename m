From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 19 Oct 2008 00:44:25 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/matchbox
Message-ID: <20081019074425.E0AB43C7BD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-19 00:44:25 -0700 (Sun, 19 Oct 2008)
New Revision: 23717

Log:
package/matchbox: fix BR2_PACKAGE_MATCHBOX_KEYBOARD Kconfig

Fix typo and wrong information in help text (not a cvs snapshot)

Modified:
   trunk/buildroot/package/matchbox/Config.in


Changeset:
Modified: trunk/buildroot/package/matchbox/Config.in
===================================================================
--- trunk/buildroot/package/matchbox/Config.in	2008-10-19 04:21:21 UTC (rev 23716)
+++ trunk/buildroot/package/matchbox/Config.in	2008-10-19 07:44:25 UTC (rev 23717)
@@ -31,8 +31,8 @@
 	  A PDA style application launcher or 'item browser'.
 
 config BR2_PACKAGE_MATCHBOX_KEYBOARD
-	bool "Metchbox Virtual Keyboard"
+	bool "Matchbox Virtual Keyboard"
 	depends on BR2_PACKAGE_MATCHBOX
 	select BR2_PACKAGE_XLIB_LIBXTST
 	help
-	  Virtual Keyboard (developement version from CVS)
+	  Virtual Keyboard
