From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 22 May 2008 14:32:29 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lxdoom
Message-ID: <20080522213229.BCE443C5EF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-05-22 14:32:26 -0700 (Thu, 22 May 2008)
New Revision: 22054

Log:
Doom WAD's depend on Doom

Modified:
   trunk/buildroot/package/lxdoom/Config.in


Changeset:
Modified: trunk/buildroot/package/lxdoom/Config.in
===================================================================
--- trunk/buildroot/package/lxdoom/Config.in	2008-05-22 21:30:44 UTC (rev 22053)
+++ trunk/buildroot/package/lxdoom/Config.in	2008-05-22 21:32:26 UTC (rev 22054)
@@ -6,5 +6,6 @@
 config BR2_PACKAGE_LXDOOM_WAD
 	bool "lxdoom-wad"
 	default n
+	depends on BR2_PACKAGE_LXDOOM
 	help
 	  This is the shareware wad data files for the doom game.
