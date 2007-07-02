From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon,  2 Jul 2007 02:54:22 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070702095422.C8E8EA65F7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-02 02:54:18 -0700 (Mon, 02 Jul 2007)
New Revision: 18991

Log:
- bump version


Modified:
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2007-07-02 08:58:56 UTC (rev 18990)
+++ trunk/buildroot/package/busybox/Config.in	2007-07-02 09:54:18 UTC (rev 18991)
@@ -46,10 +46,15 @@
 
 	config BR2_BUSYBOX_VERSION_1_5_1
 		bool "BusyBox 1.5.1"
+		depends on BR2_DEPRECATED
 
 	config BR2_BUSYBOX_VERSION_1_6_0
 		bool "BusyBox 1.6.0"
+		depends on BR2_DEPRECATED
 
+	config BR2_BUSYBOX_VERSION_1_6_1
+		bool "BusyBox 1.6.1"
+
 	config BR2_PACKAGE_BUSYBOX_SNAPSHOT
 		bool "daily snapshot"
 
