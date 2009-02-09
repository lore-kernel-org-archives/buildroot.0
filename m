From: correa at uclibc.org <correa@uclibc.org>
Date: Mon,  9 Feb 2009 17:35:02 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel:
	atngw100 atstk1005 atstk100x
Message-ID: <20090209173503.4E10C765E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2009-02-09 17:35:00 +0000 (Mon, 09 Feb 2009)
New Revision: 25279

Log:
Remove BR2_LINUX_COPYTO_TFTPBOOT from avr32 defconfigs. This will cause build to fail if user is not root and don't have a /tftpboot folder

Modified:
   trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
   trunk/buildroot/target/device/Atmel/atstk1005/atstk1005_defconfig
   trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2009-02-09 16:44:09 UTC (rev 25278)
+++ trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2009-02-09 17:35:00 UTC (rev 25279)
@@ -875,6 +875,6 @@
 # Destinations for linux kernel binaries
 #
 BR2_LINUX_COPYTO_ROOTFS=y
-BR2_LINUX_COPYTO_TFTPBOOT=y
+# BR2_LINUX_COPYTO_TFTPBOOT is not set
 BR2_LINUX_COPYTO=""
 # BR2_LINUX_COPY_CONFIGURATION is not set

Modified: trunk/buildroot/target/device/Atmel/atstk1005/atstk1005_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1005/atstk1005_defconfig	2009-02-09 16:44:09 UTC (rev 25278)
+++ trunk/buildroot/target/device/Atmel/atstk1005/atstk1005_defconfig	2009-02-09 17:35:00 UTC (rev 25279)
@@ -892,6 +892,6 @@
 # Destinations for linux kernel binaries
 #
 BR2_LINUX_COPYTO_ROOTFS=y
-BR2_LINUX_COPYTO_TFTPBOOT=y
+# BR2_LINUX_COPYTO_TFTPBOOT is not set
 BR2_LINUX_COPYTO=""
 # BR2_LINUX_COPY_CONFIGURATION is not set

Modified: trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig	2009-02-09 16:44:09 UTC (rev 25278)
+++ trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig	2009-02-09 17:35:00 UTC (rev 25279)
@@ -991,6 +991,6 @@
 # Destinations for linux kernel binaries
 #
 BR2_LINUX_COPYTO_ROOTFS=y
-BR2_LINUX_COPYTO_TFTPBOOT=y
+# BR2_LINUX_COPYTO_TFTPBOOT is not set
 BR2_LINUX_COPYTO=""
 BR2_LINUX_COPY_CONFIGURATION=y
