From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 13 Mar 2008 00:38:11 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fakeroot
Message-ID: <20080313073811.2152A12C6BE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-13 00:38:10 -0700 (Thu, 13 Mar 2008)
New Revision: 21324

Log:
fakeroot: fix tarball name

Reported by Hamish Moffatt.


Modified:
   trunk/buildroot/package/fakeroot/fakeroot.mk


Changeset:
Modified: trunk/buildroot/package/fakeroot/fakeroot.mk
===================================================================
--- trunk/buildroot/package/fakeroot/fakeroot.mk	2008-03-12 23:19:35 UTC (rev 21323)
+++ trunk/buildroot/package/fakeroot/fakeroot.mk	2008-03-13 07:38:10 UTC (rev 21324)
@@ -4,7 +4,7 @@
 #
 #############################################################
 FAKEROOT_VERSION:=1.9.3
-FAKEROOT_SOURCE:=fakeroot-$(FAKEROOT_VERSION).tar.gz
+FAKEROOT_SOURCE:=fakeroot_$(FAKEROOT_VERSION).tar.gz
 FAKEROOT_SITE:=http://snapshot.debian.net/archive/2008/02/06/debian/pool/main/f/fakeroot
 FAKEROOT_CAT:=$(ZCAT)
 FAKEROOT_SOURCE_DIR:=$(BUILD_DIR)/fakeroot-$(FAKEROOT_VERSION)
