From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  8 Jul 2007 04:56:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070708115639.132EAA4684@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-08 04:56:38 -0700 (Sun, 08 Jul 2007)
New Revision: 19029

Log:
- forgot to provide a default config for 1.6.1
  Thanks to Cristian Ionescu-Idbohrn for noticing this.


Modified:
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2007-07-08 11:25:25 UTC (rev 19028)
+++ trunk/buildroot/package/busybox/Config.in	2007-07-08 11:56:38 UTC (rev 19029)
@@ -100,6 +100,7 @@
 	default "package/busybox/busybox-1.5.0.config" if BR2_BUSYBOX_VERSION_1_5_0
 	default "package/busybox/busybox-1.5.0.config" if BR2_BUSYBOX_VERSION_1_5_1
 	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_6_0
+	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_6_1
 	help
 	  Some people may wish to use their own modified BusyBox configuration
 	  file, and will specify their config file location with this option.
