From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  2 Aug 2007 06:43:05 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sqlite
Message-ID: <20070802134305.5CC3CA4668@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-08-02 06:43:04 -0700 (Thu, 02 Aug 2007)
New Revision: 19397

Log:
Bumped version

Modified:
   trunk/buildroot/package/sqlite/sqlite.mk


Changeset:
Modified: trunk/buildroot/package/sqlite/sqlite.mk
===================================================================
--- trunk/buildroot/package/sqlite/sqlite.mk	2007-08-02 10:14:29 UTC (rev 19396)
+++ trunk/buildroot/package/sqlite/sqlite.mk	2007-08-02 13:43:04 UTC (rev 19397)
@@ -4,10 +4,10 @@
 #
 #############################################################
 
-SQLITE_VERSION=3.3.17
-SQLITE_SOURCE=sqlite-$(SQLITE_VERSION).tar.gz
-SQLITE_SITE=http://www.sqlite.org
-SQLITE_DIR=$(BUILD_DIR)/sqlite-$(SQLITE_VERSION)
+SQLITE_VERSION:=3.4.1
+SQLITE_SOURCE:=sqlite-$(SQLITE_VERSION).tar.gz
+SQLITE_SITE:=http://www.sqlite.org
+SQLITE_DIR:=$(BUILD_DIR)/sqlite-$(SQLITE_VERSION)
 SQLITE_CAT:=$(ZCAT)
 
 $(DL_DIR)/$(SQLITE_SOURCE):
