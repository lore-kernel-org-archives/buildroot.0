From: correa at uclibc.org <correa@uclibc.org>
Date: Wed, 11 Mar 2009 22:00:47 +0000 (UTC)
Subject: [Buildroot] svn commit: [25619] trunk/buildroot/package/qtopia4
Message-ID: <20090311220047.8DF497645B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2009-03-11 22:00:46 +0000 (Wed, 11 Mar 2009)
New Revision: 25619

Log:
Default yes to GUI module install on Qtopia4

Modified:
   trunk/buildroot/package/qtopia4/Config.in


Changeset:
Modified: trunk/buildroot/package/qtopia4/Config.in
===================================================================
--- trunk/buildroot/package/qtopia4/Config.in	2009-03-11 21:40:00 UTC (rev 25618)
+++ trunk/buildroot/package/qtopia4/Config.in	2009-03-11 22:00:46 UTC (rev 25619)
@@ -90,6 +90,7 @@
 
 config BR2_PACKAGE_QTOPIA4_GUI_MODULE
 	bool "Gui Module"
+	default y
 	help
 	  Turns on support to Gui applications. If your board don't have
 	  video output, or you don't require Qt GUI, say n.
