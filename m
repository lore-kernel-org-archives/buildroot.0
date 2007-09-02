From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  2 Sep 2007 15:09:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070902220912.AB659A65B0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-02 15:09:11 -0700 (Sun, 02 Sep 2007)
New Revision: 19767

Log:
- adjust list of needed applets


Modified:
   trunk/buildroot/package/busybox/initramfs.mk


Changeset:
Modified: trunk/buildroot/package/busybox/initramfs.mk
===================================================================
--- trunk/buildroot/package/busybox/initramfs.mk	2007-09-02 21:50:37 UTC (rev 19766)
+++ trunk/buildroot/package/busybox/initramfs.mk	2007-09-02 22:09:11 UTC (rev 19767)
@@ -50,14 +50,17 @@
 	 echo CONFIG_FEATURE_CHECK_TAINTED_MODULE=n; \
 	 echo CONFIG_FEATURE_2_4_MODULES=n; \
 	 echo CONFIG_MOUNT=y; \
-	 echo CONFIG_ASH=y; \
-	 echo CONFIG_FEATURE_SH_IS_ASH=y; \
+	 echo CONFIG_MSH=y; \
+	 echo CONFIG_FEATURE_SH_IS_MSH=y; \
 	 echo CONFIG_PS=y; \
 	 echo CONFIG_READLINK=y; \
 	 echo CONFIG_RMMOD=y; \
-	 echo CONFIG_SLEEP=y; \
 	 echo CONFIG_STATIC=y; \
 	 echo CONFIG_SWITCH_ROOT=y; \
+	 echo CONFIG_SYNC=y; \
+	 echo CONFIG_TFTP=y; \
+	 echo CONFIG_FEATURE_TFTP_GET=y; \
+	 echo CONFIG_FEATURE_TFTP_PUT=y; \
 	 echo CONFIG_TRUE=y; \
 	 echo CONFIG_UMOUNT=y; \
 	 echo CONFIG_FEATURE_UMOUNT_ALL=y; \
