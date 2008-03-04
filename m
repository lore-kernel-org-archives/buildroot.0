From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  4 Mar 2008 03:36:21 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/squashfs
Message-ID: <20080304113621.5D44412011B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-04 03:36:20 -0800 (Tue, 04 Mar 2008)
New Revision: 21158

Log:
squashfs: bump version



Modified:
   trunk/buildroot/target/squashfs/squashfsroot.mk


Changeset:
Modified: trunk/buildroot/target/squashfs/squashfsroot.mk
===================================================================
--- trunk/buildroot/target/squashfs/squashfsroot.mk	2008-03-02 19:57:53 UTC (rev 21157)
+++ trunk/buildroot/target/squashfs/squashfsroot.mk	2008-03-04 11:36:20 UTC (rev 21158)
@@ -3,7 +3,7 @@
 # mksquashfs to build to target squashfs filesystems
 #
 #############################################################
-SQUASHFS_VERSION:=3.2-r2
+SQUASHFS_VERSION:=3.3
 SQUASHFS_DIR:=$(BUILD_DIR)/squashfs$(SQUASHFS_VERSION)
 SQUASHFS_SOURCE:=squashfs$(SQUASHFS_VERSION).tar.gz
 SQUASHFS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/squashfs
