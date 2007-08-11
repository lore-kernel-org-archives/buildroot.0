From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 11 Aug 2007 16:33:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/uemacs
Message-ID: <20070811233323.47A1FA65C3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-11 16:33:22 -0700 (Sat, 11 Aug 2007)
New Revision: 19449

Log:
Force build of ncurses, when uemacs is selected

Modified:
   trunk/buildroot/package/uemacs/Config.in


Changeset:
Modified: trunk/buildroot/package/uemacs/Config.in
===================================================================
--- trunk/buildroot/package/uemacs/Config.in	2007-08-11 23:31:41 UTC (rev 19448)
+++ trunk/buildroot/package/uemacs/Config.in	2007-08-11 23:33:22 UTC (rev 19449)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_UEMACS
 	bool "uemacs"
 	default n
+	select BR2_PACKAGE_NCURSES
 	help
 	  A small emacs.
 
