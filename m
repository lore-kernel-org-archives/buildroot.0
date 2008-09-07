From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun,  7 Sep 2008 07:31:46 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fakeroot
Message-ID: <20080907143146.04F703C66C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-07 07:31:45 -0700 (Sun, 07 Sep 2008)
New Revision: 23356

Log:
fakeroot: bump version

Modified:
   trunk/buildroot/package/fakeroot/fakeroot.mk


Changeset:
Modified: trunk/buildroot/package/fakeroot/fakeroot.mk
===================================================================
--- trunk/buildroot/package/fakeroot/fakeroot.mk	2008-09-07 14:31:42 UTC (rev 23355)
+++ trunk/buildroot/package/fakeroot/fakeroot.mk	2008-09-07 14:31:45 UTC (rev 23356)
@@ -3,9 +3,9 @@
 # fakeroot
 #
 #############################################################
-FAKEROOT_VERSION:=1.9.3
+FAKEROOT_VERSION:=1.9.6
 FAKEROOT_SOURCE:=fakeroot_$(FAKEROOT_VERSION).tar.gz
-FAKEROOT_SITE:=http://snapshot.debian.net/archive/2008/02/06/debian/pool/main/f/fakeroot
+FAKEROOT_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/f/fakeroot
 FAKEROOT_CAT:=$(ZCAT)
 FAKEROOT_SOURCE_DIR:=$(BUILD_DIR)/fakeroot-$(FAKEROOT_VERSION)
 FAKEROOT_DIR1:=$(TOOL_BUILD_DIR)/fakeroot-$(FAKEROOT_VERSION)-host
