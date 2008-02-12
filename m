From: hamish at uclibc.org <hamish@uclibc.org>
Date: Mon, 11 Feb 2008 21:50:27 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/jffs2
Message-ID: <20080212055027.64A4912C716@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-02-11 21:50:26 -0800 (Mon, 11 Feb 2008)
New Revision: 20988

Log:
Fix typos in jffs2 summary support

Modified:
   trunk/buildroot/target/jffs2/jffs2root.mk


Changeset:
Modified: trunk/buildroot/target/jffs2/jffs2root.mk
===================================================================
--- trunk/buildroot/target/jffs2/jffs2root.mk	2008-02-12 05:39:32 UTC (rev 20987)
+++ trunk/buildroot/target/jffs2/jffs2root.mk	2008-02-12 05:50:26 UTC (rev 20988)
@@ -13,7 +13,7 @@
 else
 JFFS2_OPTS += -p
 endif
-SUMTOOLS_OPTS += -p
+SUMTOOL_OPTS += -p
 endif
 
 ifeq ($(BR2_TARGET_ROOTFS_JFFS2_SQUASH),y)
@@ -22,7 +22,7 @@
 
 ifeq ($(BR2_TARGET_ROOTFS_JFFS2_LE),y)
 JFFS2_OPTS += -l
-SUMTOOLS_OPTS += -l
+SUMTOOL_OPTS += -l
 endif
 
 ifeq ($(BR2_TARGET_ROOTFS_JFFS2_BE),y)
