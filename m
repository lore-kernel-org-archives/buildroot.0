From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 11 Jul 2007 06:55:21 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/proftpd
Message-ID: <20070711135521.086C6A65C2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-11 06:55:21 -0700 (Wed, 11 Jul 2007)
New Revision: 19059

Log:
Use <package>_VERSION in all <package>.mk instead of <package>_VER

Modified:
   trunk/buildroot/package/proftpd/proftpd.mk


Changeset:
Modified: trunk/buildroot/package/proftpd/proftpd.mk
===================================================================
--- trunk/buildroot/package/proftpd/proftpd.mk	2007-07-10 11:34:22 UTC (rev 19058)
+++ trunk/buildroot/package/proftpd/proftpd.mk	2007-07-11 13:55:21 UTC (rev 19059)
@@ -3,10 +3,10 @@
 # proftpd
 #
 #############################################################
-PROFTPD_VER:=1.3.0a
-PROFTPD_SOURCE:=proftpd-$(PROFTPD_VER).tar.bz2
+PROFTPD_VERSION:=1.3.0a
+PROFTPD_SOURCE:=proftpd-$(PROFTPD_VERSION).tar.bz2
 PROFTPD_SITE:=ftp://ftp.proftpd.org/distrib/source/
-PROFTPD_DIR:=$(BUILD_DIR)/proftpd-$(PROFTPD_VER)
+PROFTPD_DIR:=$(BUILD_DIR)/proftpd-$(PROFTPD_VERSION)
 PROFTPD_CAT:=bzcat
 PROFTPD_BINARY:=proftpd
 PROFTPD_TARGET_BINARY:=usr/sbin/proftpd
