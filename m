From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  3 Jan 2008 05:33:31 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080103133331.9956A12011E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-01-03 05:33:30 -0800 (Thu, 03 Jan 2008)
New Revision: 20705

Log:
busybox: Don't depend on long gone busybox 1.0.1 symbol



Modified:
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2008-01-03 13:33:28 UTC (rev 20704)
+++ trunk/buildroot/package/busybox/Config.in	2008-01-03 13:33:30 UTC (rev 20705)
@@ -88,7 +88,6 @@
 config BR2_PACKAGE_BUSYBOX_SKELETON
 	bool "use minimal target skeleton"
 	depends on BR2_PACKAGE_BUSYBOX
-	depends on !BR2_BUSYBOX_VERSION_1_0_1
 	help
 	  Use a minimal target skeleton. Make sure to select mdev
 	  which is used to populate /dev/.
