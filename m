From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Wed,  9 Apr 2008 22:14:53 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ncurses
Message-ID: <20080410051453.E8FA63C4F7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-04-09 22:14:53 -0700 (Wed, 09 Apr 2008)
New Revision: 21689

Log:
* Fixed copy-and-paste error, incorrect description
* Fixed another copy-and-paste error, weird space/tab mixes
- Thanks Hamish Moffatt


Modified:
   trunk/buildroot/package/ncurses/Config.in


Changeset:
Modified: trunk/buildroot/package/ncurses/Config.in
===================================================================
--- trunk/buildroot/package/ncurses/Config.in	2008-04-10 02:09:40 UTC (rev 21688)
+++ trunk/buildroot/package/ncurses/Config.in	2008-04-10 05:14:53 UTC (rev 21689)
@@ -12,7 +12,6 @@
 	default n
 	depends on BR2_PACKAGE_NCURSES
 	help
-	  Ncurses headers in target
 	  Includes ncurses dynamic libpanel in target
  
 config BR2_PACKAGE_NCURSES_TARGET_FORM
@@ -23,11 +22,11 @@
 	  Includes ncurses dynamic libform in target
  
 config BR2_PACKAGE_NCURSES_TARGET_MENU
-        bool "ncurses libmenu in target"
-        default n
-        depends on BR2_PACKAGE_NCURSES
-        help
- 	  Includes ncurses dynamic libmenu in target
+	bool "ncurses libmenu in target"
+	default n
+	depends on BR2_PACKAGE_NCURSES
+	help
+	  Includes ncurses dynamic libmenu in target
 
 config BR2_PACKAGE_NCURSES_TARGET_HEADERS
 	bool "ncurses headers in target"
