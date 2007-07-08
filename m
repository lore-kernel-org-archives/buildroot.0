From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Sun, 8 Jul 2007 15:42:30 +0200 (CEST)
Subject: [Buildroot] package/busybox: copy/paste err
Message-ID: <0707081541120.3987@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Index: Config.in
===================================================================
--- Config.in	(revision 19036)
+++ Config.in	(working copy)
@@ -100,7 +100,7 @@
 	default "package/busybox/busybox-1.5.0.config" if BR2_BUSYBOX_VERSION_1_5_0
 	default "package/busybox/busybox-1.5.0.config" if BR2_BUSYBOX_VERSION_1_5_1
 	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_6_0
-	default "package/busybox/busybox-1.6.0.config" if BR2_BUSYBOX_VERSION_1_6_1
+	default "package/busybox/busybox-1.6.1.config" if BR2_BUSYBOX_VERSION_1_6_1
 	help
 	  Some people may wish to use their own modified BusyBox configuration
 	  file, and will specify their config file location with this option.


-- 
Cristian
