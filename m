From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri,  7 Mar 2008 02:02:12 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/editors/vim
Message-ID: <20080307100212.43848120159@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-07 02:02:12 -0800 (Fri, 07 Mar 2008)
New Revision: 21265

Log:
vim: config names should be lower case


Modified:
   trunk/buildroot/package/editors/vim/Config.in


Changeset:
Modified: trunk/buildroot/package/editors/vim/Config.in
===================================================================
--- trunk/buildroot/package/editors/vim/Config.in	2008-03-07 10:00:04 UTC (rev 21264)
+++ trunk/buildroot/package/editors/vim/Config.in	2008-03-07 10:02:12 UTC (rev 21265)
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_VIM
-	bool "Vim"
+	bool "vim"
 	default n
 	select BR2_PACKAGE_NCURSES
 	help
@@ -8,7 +8,7 @@
 	  http://www.vim.org/
 
 config BR2_PACKAGE_VIM_RUNTIME
-	bool "Install runtime"
+	bool "install runtime"
 	default y
 	depends BR2_PACKAGE_VIM
 	help
