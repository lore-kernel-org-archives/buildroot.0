From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  8 Dec 2008 01:07:02 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/tar
Message-ID: <20081208090702.9E9283C6FB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-08 01:07:01 -0800 (Mon, 08 Dec 2008)
New Revision: 24315

Log:
target/tar: remove unused cut'n'paste leftover

Modified:
   trunk/buildroot/target/tar/tarroot.mk


Changeset:
Modified: trunk/buildroot/target/tar/tarroot.mk
===================================================================
--- trunk/buildroot/target/tar/tarroot.mk	2008-12-08 09:06:59 UTC (rev 24314)
+++ trunk/buildroot/target/tar/tarroot.mk	2008-12-08 09:07:01 UTC (rev 24315)
@@ -57,10 +57,6 @@
 endif
 	- at rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 
-EXT2_COPYTO := $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_COPYTO))
-# "))
-
-
 tarroot-source:
 
 tarroot-clean:
