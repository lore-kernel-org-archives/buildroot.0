From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 21 Nov 2008 22:49:30 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lockfile-progs
Message-ID: <20081122064930.839E33C776@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-21 22:49:30 -0800 (Fri, 21 Nov 2008)
New Revision: 24118

Log:
lockfile-progs: remove unneeded $(strip)

Modified:
   trunk/buildroot/package/lockfile-progs/lockfile-progs.mk


Changeset:
Modified: trunk/buildroot/package/lockfile-progs/lockfile-progs.mk
===================================================================
--- trunk/buildroot/package/lockfile-progs/lockfile-progs.mk	2008-11-22 01:32:40 UTC (rev 24117)
+++ trunk/buildroot/package/lockfile-progs/lockfile-progs.mk	2008-11-22 06:49:30 UTC (rev 24118)
@@ -40,6 +40,6 @@
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(strip $(BR2_PACKAGE_LOCKFILE_PROGS)),y)
+ifeq ($(BR2_PACKAGE_LOCKFILE_PROGS),y)
 TARGETS+=lockfile-progs
 endif
