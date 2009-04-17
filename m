From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 17 Apr 2009 07:38:04 +0000 (UTC)
Subject: [Buildroot] svn commit: [26130]
	trunk/buildroot/package/database/sqlite
Message-ID: <20090417073804.55CB1763EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-17 07:38:03 +0000 (Fri, 17 Apr 2009)
New Revision: 26130

Log:
sqlite: bump version

Closes #277.

Modified:
   trunk/buildroot/package/database/sqlite/sqlite.mk


Changeset:
Modified: trunk/buildroot/package/database/sqlite/sqlite.mk
===================================================================
--- trunk/buildroot/package/database/sqlite/sqlite.mk	2009-04-17 05:50:44 UTC (rev 26129)
+++ trunk/buildroot/package/database/sqlite/sqlite.mk	2009-04-17 07:38:03 UTC (rev 26130)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQLITE_VERSION = 3.6.12
+SQLITE_VERSION = 3.6.13
 SQLITE_SOURCE = sqlite-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org
 SQLITE_INSTALL_STAGING = YES
