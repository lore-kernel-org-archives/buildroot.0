From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 20 May 2008 14:35:55 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lockfile-progs
Message-ID: <20080520213556.023BD3C7D7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-05-20 14:35:55 -0700 (Tue, 20 May 2008)
New Revision: 22030

Log:
Update lockfile-progs version

Modified:
   trunk/buildroot/package/lockfile-progs/lockfile-progs.mk


Changeset:
Modified: trunk/buildroot/package/lockfile-progs/lockfile-progs.mk
===================================================================
--- trunk/buildroot/package/lockfile-progs/lockfile-progs.mk	2008-05-20 20:44:08 UTC (rev 22029)
+++ trunk/buildroot/package/lockfile-progs/lockfile-progs.mk	2008-05-20 21:35:55 UTC (rev 22030)
@@ -3,11 +3,11 @@
 # lockfile-progs
 #
 #############################################################
-LOCKFILE_PROGS_VERSION=0.1.11
+LOCKFILE_PROGS_VERSION=0.1.11-0.1
 LOCKFILE_PROGS_SOURCE:=lockfile-progs_$(LOCKFILE_PROGS_VERSION).tar.gz
 LOCKFILE_PROGS_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/l/lockfile-progs/
 LOCKFILE_PROGS_CAT:=$(ZCAT)
-LOCKFILE_PROGS_DIR:=$(BUILD_DIR)/sid
+LOCKFILE_PROGS_DIR:=$(BUILD_DIR)/lockfile-progs-0.1.11
 LOCKFILE_PROGS_BINARY:=usr/bin/lockfile-create
 
 $(DL_DIR)/$(LOCKFILE_PROGS_SOURCE):
