From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  3 Apr 2007 08:36:04 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fakeroot
Message-ID: <20070403153604.26FBA4807E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-04-03 08:36:03 -0700 (Tue, 03 Apr 2007)
New Revision: 18314

Log:
Version bump. Thanks to Michael Benedict

Modified:
   trunk/buildroot/package/fakeroot/fakeroot.mk


Changeset:
Modified: trunk/buildroot/package/fakeroot/fakeroot.mk
===================================================================
--- trunk/buildroot/package/fakeroot/fakeroot.mk	2007-04-03 15:35:26 UTC (rev 18313)
+++ trunk/buildroot/package/fakeroot/fakeroot.mk	2007-04-03 15:36:03 UTC (rev 18314)
@@ -3,7 +3,7 @@
 # fakeroot
 #
 #############################################################
-FAKEROOT_VERSION:=1.6.4
+FAKEROOT_VERSION:=1.6.5
 FAKEROOT_SOURCE:=fakeroot_$(FAKEROOT_VERSION).tar.gz
 FAKEROOT_SITE:=http://ftp.debian.org/debian/pool/main/f/fakeroot
 FAKEROOT_CAT:=$(ZCAT)
