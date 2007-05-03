From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  3 May 2007 02:33:26 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sqlite
Message-ID: <20070503093326.4B21548595@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-05-03 02:33:24 -0700 (Thu, 03 May 2007)
New Revision: 18550

Log:
version bump

Modified:
   trunk/buildroot/package/sqlite/sqlite.mk


Changeset:
Modified: trunk/buildroot/package/sqlite/sqlite.mk
===================================================================
--- trunk/buildroot/package/sqlite/sqlite.mk	2007-05-03 08:25:17 UTC (rev 18549)
+++ trunk/buildroot/package/sqlite/sqlite.mk	2007-05-03 09:33:24 UTC (rev 18550)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQLITE_VERSION=3.3.16
+SQLITE_VERSION=3.3.17
 SQLITE_SOURCE=sqlite-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE=http://www.sqlite.org
 SQLITE_DIR=$(BUILD_DIR)/sqlite-$(SQLITE_VERSION)
