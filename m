From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 21 Sep 2007 02:45:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libtool
Message-ID: <20070921094514.D4335A5E12@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-21 02:45:13 -0700 (Fri, 21 Sep 2007)
New Revision: 19925

Log:
- bump version


Modified:
   trunk/buildroot/package/libtool/libtool.mk


Changeset:
Modified: trunk/buildroot/package/libtool/libtool.mk
===================================================================
--- trunk/buildroot/package/libtool/libtool.mk	2007-09-21 08:19:27 UTC (rev 19924)
+++ trunk/buildroot/package/libtool/libtool.mk	2007-09-21 09:45:13 UTC (rev 19925)
@@ -3,7 +3,7 @@
 # libtool
 #
 #############################################################
-LIBTOOL_VERSION:=1.5.22
+LIBTOOL_VERSION:=1.5.24
 LIBTOOL_SOURCE:=libtool-$(LIBTOOL_VERSION).tar.gz
 LIBTOOL_SITE:=http://ftp.gnu.org/pub/gnu/libtool
 LIBTOOL_CAT:=$(ZCAT)
