From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 27 Aug 2008 00:46:56 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/squashfs
Message-ID: <20080827074656.14DEF3C6A5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-27 00:46:55 -0700 (Wed, 27 Aug 2008)
New Revision: 23238

Log:
squashfs: bump version

Modified:
   trunk/buildroot/target/squashfs/squashfsroot.mk


Changeset:
Modified: trunk/buildroot/target/squashfs/squashfsroot.mk
===================================================================
--- trunk/buildroot/target/squashfs/squashfsroot.mk	2008-08-27 07:39:57 UTC (rev 23237)
+++ trunk/buildroot/target/squashfs/squashfsroot.mk	2008-08-27 07:46:55 UTC (rev 23238)
@@ -3,7 +3,7 @@
 # mksquashfs to build to target squashfs filesystems
 #
 #############################################################
-SQUASHFS_VERSION:=3.3
+SQUASHFS_VERSION:=3.4
 SQUASHFS_DIR:=$(BUILD_DIR)/squashfs$(SQUASHFS_VERSION)
 SQUASHFS_SOURCE:=squashfs$(SQUASHFS_VERSION).tar.gz
 SQUASHFS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/squashfs
