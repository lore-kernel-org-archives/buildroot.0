From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  2 Sep 2008 06:54:56 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/file
Message-ID: <20080902135456.460643C66C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-02 06:54:55 -0700 (Tue, 02 Sep 2008)
New Revision: 23305

Log:
file: bump version and use official upstream instead of Debian

Debian is a bit too volatile.

Modified:
   trunk/buildroot/package/file/file.mk


Changeset:
Modified: trunk/buildroot/package/file/file.mk
===================================================================
--- trunk/buildroot/package/file/file.mk	2008-09-02 11:14:04 UTC (rev 23304)
+++ trunk/buildroot/package/file/file.mk	2008-09-02 13:54:55 UTC (rev 23305)
@@ -3,9 +3,9 @@
 # file
 #
 #############################################################
-FILE_VERSION:=4.24
-FILE_SOURCE:=file_$(FILE_VERSION).orig.tar.gz
-FILE_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/f/file
+FILE_VERSION:=4.26
+FILE_SOURCE:=file-$(FILE_VERSION).tar.gz
+FILE_SITE:=ftp://ftp.astron.com/pub/file/
 FILE_SOURCE_DIR:=$(BUILD_DIR)/file-$(FILE_VERSION)
 FILE_DIR1:=$(TOOL_BUILD_DIR)/file-$(FILE_VERSION)-host
 FILE_DIR2:=$(BUILD_DIR)/file-$(FILE_VERSION)-target
