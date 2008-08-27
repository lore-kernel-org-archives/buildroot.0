From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 27 Aug 2008 13:19:40 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pcmanfm
Message-ID: <20080827201941.05AF0F802C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-27 13:19:40 -0700 (Wed, 27 Aug 2008)
New Revision: 23265

Log:
pcmanfm: fix long help text lines

Modified:
   trunk/buildroot/package/pcmanfm/Config.in


Changeset:
Modified: trunk/buildroot/package/pcmanfm/Config.in
===================================================================
--- trunk/buildroot/package/pcmanfm/Config.in	2008-08-27 20:19:37 UTC (rev 23264)
+++ trunk/buildroot/package/pcmanfm/Config.in	2008-08-27 20:19:40 UTC (rev 23265)
@@ -5,6 +5,7 @@
 	select BR2_PACKAGE_STARTUP_NOTIFICATION
 	select BR2_PACKAGE_LIBGTK2
 	help
-	  An extremly fast and lightweight file manager which features tabbed browsing and user-friendly interface.
+	  An extremly fast and lightweight file manager which features
+	  tabbed browsing and user-friendly interface.
 
 	  http://internap.dl.sourceforge.net/sourceforge/pcmanfm
