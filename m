From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu,  1 Feb 2007 04:30:35 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070201123035.3B7974859A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-01 04:30:34 -0800 (Thu, 01 Feb 2007)
New Revision: 17697

Log:
- the generic x86 busybox config is ment for current busybox trunk


Modified:
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2007-02-01 07:30:37 UTC (rev 17696)
+++ trunk/buildroot/package/busybox/Config.in	2007-02-01 12:30:34 UTC (rev 17697)
@@ -50,7 +50,7 @@
 config BR2_PACKAGE_BUSYBOX_CONFIG
 	string "BusyBox configuration file to use?"
 	depends BR2_PACKAGE_BUSYBOX
-	default "target/device/x86/i386/busybox.config" if BR2_i386
+	default "target/device/x86/i386/busybox.config" if BR2_i386 && BR2_PACKAGE_BUSYBOX_SNAPSHOT
 	default "package/busybox/busybox-1.0.1.config" if BR2_BUSYBOX_VERSION_1_0_1
 	default "package/busybox/busybox-1.1.3.config" if BR2_BUSYBOX_VERSION_1_1_3
 	default "package/busybox/busybox-1.2.2.1.config" if BR2_BUSYBOX_VERSION_1_2_2_1
