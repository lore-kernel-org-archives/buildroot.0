From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 24 Apr 2008 02:03:06 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sqlite
Message-ID: <20080424090306.44FD33C7C1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-24 02:03:05 -0700 (Thu, 24 Apr 2008)
New Revision: 21820

Log:
sqlite: bump version


Modified:
   trunk/buildroot/package/sqlite/sqlite.mk


Changeset:
Modified: trunk/buildroot/package/sqlite/sqlite.mk
===================================================================
--- trunk/buildroot/package/sqlite/sqlite.mk	2008-04-24 07:15:37 UTC (rev 21819)
+++ trunk/buildroot/package/sqlite/sqlite.mk	2008-04-24 09:03:05 UTC (rev 21820)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQLITE_VERSION:=3.5.7
+SQLITE_VERSION:=3.5.8
 SQLITE_SOURCE:=sqlite-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE:=http://www.sqlite.org
 SQLITE_DIR:=$(BUILD_DIR)/sqlite-$(SQLITE_VERSION)
