From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 20 Apr 2007 05:42:42 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sqlite
Message-ID: <20070420124242.7811B4808A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-04-20 05:42:41 -0700 (Fri, 20 Apr 2007)
New Revision: 18504

Log:
Bumped version

Modified:
   trunk/buildroot/package/sqlite/sqlite.mk


Changeset:
Modified: trunk/buildroot/package/sqlite/sqlite.mk
===================================================================
--- trunk/buildroot/package/sqlite/sqlite.mk	2007-04-20 11:12:50 UTC (rev 18503)
+++ trunk/buildroot/package/sqlite/sqlite.mk	2007-04-20 12:42:41 UTC (rev 18504)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQLITE_VERSION=3.3.15
+SQLITE_VERSION=3.3.16
 SQLITE_SOURCE=sqlite-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE=http://www.sqlite.org
 SQLITE_DIR=$(BUILD_DIR)/sqlite-$(SQLITE_VERSION)
