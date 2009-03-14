From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 14 Mar 2009 14:58:40 +0000 (UTC)
Subject: [Buildroot] svn commit: [25651] trunk/buildroot/package/blackbox
Message-ID: <20090314145840.AB10A7643C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-14 14:58:40 +0000 (Sat, 14 Mar 2009)
New Revision: 25651

Log:
blackbox: needs c++ support

Modified:
   trunk/buildroot/package/blackbox/Config.in


Changeset:
Modified: trunk/buildroot/package/blackbox/Config.in
===================================================================
--- trunk/buildroot/package/blackbox/Config.in	2009-03-14 11:30:56 UTC (rev 25650)
+++ trunk/buildroot/package/blackbox/Config.in	2009-03-14 14:58:40 UTC (rev 25651)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_BLACKBOX
 	bool "blackbox"
 	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Blackbox is a fast, lightweight window manager for the X
 	  Window System.
