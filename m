From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  3 Apr 2007 08:36:18 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/valgrind
Message-ID: <20070403153618.7F9ED4808A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-04-03 08:36:16 -0700 (Tue, 03 Apr 2007)
New Revision: 18315

Log:
Version bump. Thanks to Michael Benedict

Modified:
   trunk/buildroot/package/valgrind/valgrind.mk


Changeset:
Modified: trunk/buildroot/package/valgrind/valgrind.mk
===================================================================
--- trunk/buildroot/package/valgrind/valgrind.mk	2007-04-03 15:36:03 UTC (rev 18314)
+++ trunk/buildroot/package/valgrind/valgrind.mk	2007-04-03 15:36:16 UTC (rev 18315)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-VALGRIND_VERSION=3.2.1
+VALGRIND_VERSION=3.2.3
 VALGRIND_SITE:=http://valgrind.org/downloads/
 VALGRIND_DIR:=$(BUILD_DIR)/valgrind-$(VALGRIND_VERSION)
 VALGRIND_SOURCE:=valgrind-$(VALGRIND_VERSION).tar.bz2
