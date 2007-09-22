From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 22 Sep 2007 10:29:26 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070922172926.97AF0A65BD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-22 10:29:23 -0700 (Sat, 22 Sep 2007)
New Revision: 19944

Log:
- fix typo in .config filename


Modified:
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2007-09-22 16:42:25 UTC (rev 19943)
+++ trunk/buildroot/package/busybox/Config.in	2007-09-22 17:29:23 UTC (rev 19944)
@@ -112,7 +112,7 @@
 	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_6_0
 	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_6_1
 	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_7_0
-	default "package/busybox/busybox-1.6.1.config" if BR2_BUSYBOX_VERSION_1_7_1
+	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_7_1
 	help
 	  Some people may wish to use their own modified BusyBox configuration
 	  file, and will specify their config file location with this option.
