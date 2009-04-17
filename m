From: correa at uclibc.org <correa@uclibc.org>
Date: Fri, 17 Apr 2009 05:44:02 +0000 (UTC)
Subject: [Buildroot] svn commit: [26128]
	trunk/buildroot/target/device/x86/i686
Message-ID: <20090417054402.6001A763A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2009-04-17 05:44:01 +0000 (Fri, 17 Apr 2009)
New Revision: 26128

Log:
Fix busybox config file location

Modified:
   trunk/buildroot/target/device/x86/i686/i686_defconfig


Changeset:
Modified: trunk/buildroot/target/device/x86/i686/i686_defconfig
===================================================================
--- trunk/buildroot/target/device/x86/i686/i686_defconfig	2009-04-17 00:01:04 UTC (rev 26127)
+++ trunk/buildroot/target/device/x86/i686/i686_defconfig	2009-04-17 05:44:01 UTC (rev 26128)
@@ -280,7 +280,7 @@
 # BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
 BR2_BUSYBOX_VERSION="1.13.2"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.6.0.config"
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
 BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
 # BR2_PACKAGE_BUSYBOX_SKELETON is not set
 
