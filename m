From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 25 Sep 2006 00:27:46 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/valgrind
Message-ID: <20060925072746.7E5B14869E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2006-09-25 00:27:46 -0700 (Mon, 25 Sep 2006)
New Revision: 16214

Log:
Bump version

Modified:
   trunk/buildroot/package/valgrind/valgrind.mk


Changeset:
Modified: trunk/buildroot/package/valgrind/valgrind.mk
===================================================================
--- trunk/buildroot/package/valgrind/valgrind.mk	2006-09-24 21:29:13 UTC (rev 16213)
+++ trunk/buildroot/package/valgrind/valgrind.mk	2006-09-25 07:27:46 UTC (rev 16214)
@@ -4,9 +4,10 @@
 #
 #############################################################
 
+VALGRIND_VERSION=3.2.1
 VALGRIND_SITE:=http://valgrind.org/downloads/
-VALGRIND_DIR:=$(BUILD_DIR)/valgrind-3.2.0
-VALGRIND_SOURCE:=valgrind-3.2.0.tar.bz2
+VALGRIND_DIR:=$(BUILD_DIR)/valgrind-$(VALGRIND_VERSION)
+VALGRIND_SOURCE:=valgrind-$(VALGRIND_VERSION).tar.bz2
 
 $(DL_DIR)/$(VALGRIND_SOURCE):
 	$(WGET) -P $(DL_DIR) $(VALGRIND_SITE)/$(VALGRIND_SOURCE)
