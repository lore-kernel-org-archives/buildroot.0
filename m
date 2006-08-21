From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 21 Aug 2006 00:24:22 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/squashfs
Message-ID: <20060821072422.8D35A486ED@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2006-08-21 00:24:22 -0700 (Mon, 21 Aug 2006)
New Revision: 15888

Log:
Bump to upstream v3.1

Modified:
   trunk/buildroot/target/squashfs/squashfsroot.mk


Changeset:
Modified: trunk/buildroot/target/squashfs/squashfsroot.mk
===================================================================
--- trunk/buildroot/target/squashfs/squashfsroot.mk	2006-08-21 05:20:52 UTC (rev 15887)
+++ trunk/buildroot/target/squashfs/squashfsroot.mk	2006-08-21 07:24:22 UTC (rev 15888)
@@ -3,7 +3,7 @@
 # mksquashfs to build to target squashfs filesystems
 #
 #############################################################
-SQUASHFS_VERSION:=3.0
+SQUASHFS_VERSION:=3.1
 SQUASHFS_DIR:=$(BUILD_DIR)/squashfs$(SQUASHFS_VERSION)
 SQUASHFS_SOURCE:=squashfs$(SQUASHFS_VERSION).tar.gz
 SQUASHFS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/squashfs
