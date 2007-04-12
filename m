From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 12 Apr 2007 04:24:40 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sqlite
Message-ID: <20070412112440.8D6EE485A4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-04-12 04:24:38 -0700 (Thu, 12 Apr 2007)
New Revision: 18412

Log:
Bumped version

Modified:
   trunk/buildroot/package/sqlite/sqlite.mk


Changeset:
Modified: trunk/buildroot/package/sqlite/sqlite.mk
===================================================================
--- trunk/buildroot/package/sqlite/sqlite.mk	2007-04-12 03:41:16 UTC (rev 18411)
+++ trunk/buildroot/package/sqlite/sqlite.mk	2007-04-12 11:24:38 UTC (rev 18412)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQLITE_VERSION=3.3.13
+SQLITE_VERSION=3.3.15
 SQLITE_SOURCE=sqlite-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE=http://www.sqlite.org
 SQLITE_DIR=$(BUILD_DIR)/sqlite-$(SQLITE_VERSION)
