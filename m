From: andersen at uclibc.org <andersen@uclibc.org>
Date: Tue, 12 Dec 2006 22:59:34 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20061213065934.C10264858F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-12-12 22:59:34 -0800 (Tue, 12 Dec 2006)
New Revision: 16872

Log:
update defconfig


Modified:
   trunk/buildroot/defconfig


Changeset:
Modified: trunk/buildroot/defconfig
===================================================================
--- trunk/buildroot/defconfig	2006-12-13 06:59:01 UTC (rev 16871)
+++ trunk/buildroot/defconfig	2006-12-13 06:59:34 UTC (rev 16872)
@@ -157,9 +157,12 @@
 # The default minimal system
 #
 BR2_PACKAGE_BUSYBOX=y
+# BR2_BUSYBOX_VERSION_1_0_1 is not set
+# BR2_BUSYBOX_VERSION_1_1_3 is not set
+BR2_BUSYBOX_VERSION_1_2_2_1=y
 # BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
 BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS=y
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox.config"
+BR2_PACKAGE_BUSYBOX_CONFIG="target/device/x86/i386/busybox.config"
 
 #
 # The minimum needed to build a uClibc development system
