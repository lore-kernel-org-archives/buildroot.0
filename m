From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 29 Jan 2007 00:45:38 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/iso9660
Message-ID: <20070129084538.63C7748591@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-29 00:45:36 -0800 (Mon, 29 Jan 2007)
New Revision: 17626

Log:
- be gentle to vi's syntax highlighting


Modified:
   trunk/buildroot/target/iso9660/iso9660.mk


Changeset:
Modified: trunk/buildroot/target/iso9660/iso9660.mk
===================================================================
--- trunk/buildroot/target/iso9660/iso9660.mk	2007-01-29 04:32:20 UTC (rev 17625)
+++ trunk/buildroot/target/iso9660/iso9660.mk	2007-01-29 08:45:36 UTC (rev 17626)
@@ -45,8 +45,9 @@
 
 ISO9660_TARGET_DIR=$(BUILD_DIR)/iso9660
 ISO9660_TARGET:=$(subst ",,$(BR2_TARGET_ROOTFS_ISO9660_OUTPUT))
+#")
 ISO9660_BOOT_MENU:=$(subst ",,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
-
+#")
 ISO9660_OPTS:=
 
 ifeq ($(strip $(BR2_TARGET_ROOTFS_ISO9660_SQUASH)),y)
