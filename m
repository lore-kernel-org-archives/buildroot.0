From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:37:30 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/xorg
Message-ID: <20080306183730.7404B120250@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:37:29 -0800 (Thu, 06 Mar 2008)
New Revision: 21243

Log:
deprecate xorg 6.8

Modified:
   trunk/buildroot/package/xorg/Config.in


Changeset:
Modified: trunk/buildroot/package/xorg/Config.in
===================================================================
--- trunk/buildroot/package/xorg/Config.in	2008-03-06 18:36:54 UTC (rev 21242)
+++ trunk/buildroot/package/xorg/Config.in	2008-03-06 18:37:29 UTC (rev 21243)
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XORG
+	depends BR2_DEPRECATED
 	bool "X.org X Window System"
 	default y if BR2_PACKAGE_XSERVER_xorg
 	select BR2_PACKAGE_ZLIB
