From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun,  1 Mar 2009 20:20:20 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/tar
Message-ID: <20090301202020.C8CD3769D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-01 20:20:20 +0000 (Sun, 01 Mar 2009)
New Revision: 25474

Log:
tar: bump version

Fixes #69

Modified:
   trunk/buildroot/package/tar/tar.mk


Changeset:
Modified: trunk/buildroot/package/tar/tar.mk
===================================================================
--- trunk/buildroot/package/tar/tar.mk	2009-03-01 20:20:15 UTC (rev 25473)
+++ trunk/buildroot/package/tar/tar.mk	2009-03-01 20:20:20 UTC (rev 25474)
@@ -3,7 +3,7 @@
 # tar
 #
 #############################################################
-GNUTAR_VERSION:=1.18
+GNUTAR_VERSION:=1.21
 GNUTAR_SOURCE:=tar-$(GNUTAR_VERSION).tar.bz2
 GNUTAR_SITE:=$(BR2_GNU_MIRROR)/tar/
 GNUTAR_DIR:=$(BUILD_DIR)/tar-$(GNUTAR_VERSION)
