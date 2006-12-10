From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 10 Dec 2006 05:42:16 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/cramfs
Message-ID: <20061210134216.F4239485A8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-10 05:42:16 -0800 (Sun, 10 Dec 2006)
New Revision: 16834

Log:
- cosmetic vi syntax highlighting improvement


Modified:
   trunk/buildroot/target/cramfs/cramfs.mk


Changeset:
Modified: trunk/buildroot/target/cramfs/cramfs.mk
===================================================================
--- trunk/buildroot/target/cramfs/cramfs.mk	2006-12-10 13:40:16 UTC (rev 16833)
+++ trunk/buildroot/target/cramfs/cramfs.mk	2006-12-10 13:42:16 UTC (rev 16834)
@@ -6,7 +6,7 @@
 CRAMFS_DIR=$(BUILD_DIR)/cramfs-1.1
 CRAMFS_SOURCE=cramfs-1.1.tar.gz
 ifeq ($(strip $(subst ",,$(BR2_SOURCEFORGE_MIRROR))),unc)
-# " stupid syntax highlighting does not like unmatched quote from above line
+# "))
 # UNC does not seem to have cramfs
 CRAMFS_SITE=http://internap.dl.sourceforge.net/sourceforge/cramfs
 else
