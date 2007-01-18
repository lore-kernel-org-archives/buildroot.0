From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 18 Jan 2007 04:39:06 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/squashfs
Message-ID: <20070118123906.2D9EA4858A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-01-18 04:39:05 -0800 (Thu, 18 Jan 2007)
New Revision: 17364

Log:
Bump version

Modified:
   trunk/buildroot/target/squashfs/squashfsroot.mk


Changeset:
Modified: trunk/buildroot/target/squashfs/squashfsroot.mk
===================================================================
--- trunk/buildroot/target/squashfs/squashfsroot.mk	2007-01-18 10:32:09 UTC (rev 17363)
+++ trunk/buildroot/target/squashfs/squashfsroot.mk	2007-01-18 12:39:05 UTC (rev 17364)
@@ -3,7 +3,7 @@
 # mksquashfs to build to target squashfs filesystems
 #
 #############################################################
-SQUASHFS_VERSION:=3.1
+SQUASHFS_VERSION:=3.2-r2
 SQUASHFS_DIR:=$(BUILD_DIR)/squashfs$(SQUASHFS_VERSION)
 SQUASHFS_SOURCE:=squashfs$(SQUASHFS_VERSION).tar.gz
 SQUASHFS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/squashfs
