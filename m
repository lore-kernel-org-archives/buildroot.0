From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  6 Feb 2007 08:20:29 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070206162029.B0190485FD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-02-06 08:20:29 -0800 (Tue, 06 Feb 2007)
New Revision: 17790

Log:
hide busybox version selector if disabled

Modified:
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2007-02-06 16:18:12 UTC (rev 17789)
+++ trunk/buildroot/package/busybox/Config.in	2007-02-06 16:20:29 UTC (rev 17790)
@@ -11,6 +11,7 @@
 
 choice
 	prompt "BusyBox Version"
+	depends BR2_PACKAGE_BUSYBOX
 	default BR2_BUSYBOX_VERSION_1_2_2_1
 	help
 	  Select the version of BusyBox you wish to use.
