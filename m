From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 25 Jun 2008 23:51:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080626065112.3F4CB3C289@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-25 23:51:11 -0700 (Wed, 25 Jun 2008)
New Revision: 22514

Log:
busybox: mark old versions as deprecated


Modified:
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2008-06-26 06:50:59 UTC (rev 22513)
+++ trunk/buildroot/package/busybox/Config.in	2008-06-26 06:51:11 UTC (rev 22514)
@@ -26,14 +26,15 @@
 
 	config BR2_BUSYBOX_VERSION_1_7_X
 		bool "BusyBox 1.7.x"
-		depends on BR2_DEPRECATED || BR2_RECENT
+		depends on BR2_DEPRECATED
 
 	config BR2_BUSYBOX_VERSION_1_8_X
 		bool "BusyBox 1.8.x"
-		depends on BR2_DEPRECATED || BR2_RECENT
+		depends on BR2_DEPRECATED
 
 	config BR2_BUSYBOX_VERSION_1_9_X
 		bool "BusyBox 1.9.x"
+		depends on BR2_DEPRECATED || BR2_RECENT
 
 	config BR2_BUSYBOX_VERSION_1_10_X
 		bool "BusyBox 1.10.x"
