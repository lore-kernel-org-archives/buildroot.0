From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  1 Apr 2009 14:15:04 +0000 (UTC)
Subject: [Buildroot] svn commit: [25919] trunk/buildroot/package/fakeroot
Message-ID: <20090401141504.E457A77669@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-01 14:15:04 +0000 (Wed, 01 Apr 2009)
New Revision: 25919

Log:
fakeroot: build host version under BUILD_DIR as well

Modified:
   trunk/buildroot/package/fakeroot/fakeroot.mk


Changeset:
Modified: trunk/buildroot/package/fakeroot/fakeroot.mk
===================================================================
--- trunk/buildroot/package/fakeroot/fakeroot.mk	2009-04-01 13:02:07 UTC (rev 25918)
+++ trunk/buildroot/package/fakeroot/fakeroot.mk	2009-04-01 14:15:04 UTC (rev 25919)
@@ -8,7 +8,7 @@
 FAKEROOT_SITE:=http://snapshot.debian.net/archive/2008/04/27/debian/pool/main/f/fakeroot/
 FAKEROOT_CAT:=$(ZCAT)
 FAKEROOT_SOURCE_DIR:=$(BUILD_DIR)/fakeroot-$(FAKEROOT_VERSION)
-FAKEROOT_DIR1:=$(TOOL_BUILD_DIR)/fakeroot-$(FAKEROOT_VERSION)-host
+FAKEROOT_DIR1:=$(BUILD_DIR)/fakeroot-$(FAKEROOT_VERSION)-host
 FAKEROOT_DIR2:=$(BUILD_DIR)/fakeroot-$(FAKEROOT_VERSION)-target
 
 $(DL_DIR)/$(FAKEROOT_SOURCE):
