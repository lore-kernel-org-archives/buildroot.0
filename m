From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue,  4 Sep 2007 23:52:09 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/at91sam9260dfc
Message-ID: <20070905065209.A8716A688F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-04 23:52:09 -0700 (Tue, 04 Sep 2007)
New Revision: 19790

Log:
Update defconfig for AT91SAM9260

Modified:
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc-linux-2.6.22.1.config


Changeset:
Modified: trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc-linux-2.6.22.1.config
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc-linux-2.6.22.1.config	2007-09-05 06:51:38 UTC (rev 19789)
+++ trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc-linux-2.6.22.1.config	2007-09-05 06:52:09 UTC (rev 19790)
@@ -51,9 +51,6 @@
 CONFIG_SYSFS_DEPRECATED=y
 # CONFIG_RELAY is not set
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_INITRAMFS_SOURCE="/home/ulf/projects/Buildroot/20070817/buildroot-arm/binaries/at91sam9261ek/rootfs.arm.initramfs_list"
-CONFIG_INITRAMFS_ROOT_UID=0
-CONFIG_INITRAMFS_ROOT_GID=0
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_SYSCTL=y
 # CONFIG_EMBEDDED is not set
