From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  1 Dec 2008 01:08:04 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fakeroot
Message-ID: <20081201090804.87FE03C65A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-01 01:08:04 -0800 (Mon, 01 Dec 2008)
New Revision: 24200

Log:
fakeroot: use 1.9.5 from snapshot.debian.net

Modified:
   trunk/buildroot/package/fakeroot/fakeroot.mk


Changeset:
Modified: trunk/buildroot/package/fakeroot/fakeroot.mk
===================================================================
--- trunk/buildroot/package/fakeroot/fakeroot.mk	2008-12-01 09:08:01 UTC (rev 24199)
+++ trunk/buildroot/package/fakeroot/fakeroot.mk	2008-12-01 09:08:04 UTC (rev 24200)
@@ -3,9 +3,9 @@
 # fakeroot
 #
 #############################################################
-FAKEROOT_VERSION:=1.9.6
+FAKEROOT_VERSION:=1.9.5
 FAKEROOT_SOURCE:=fakeroot_$(FAKEROOT_VERSION).tar.gz
-FAKEROOT_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/f/fakeroot
+FAKEROOT_SITE:=http://snapshot.debian.net/archive/2008/04/27/debian/pool/main/f/fakeroot/
 FAKEROOT_CAT:=$(ZCAT)
 FAKEROOT_SOURCE_DIR:=$(BUILD_DIR)/fakeroot-$(FAKEROOT_VERSION)
 FAKEROOT_DIR1:=$(TOOL_BUILD_DIR)/fakeroot-$(FAKEROOT_VERSION)-host
