From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 16 Jun 2008 04:15:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/file
Message-ID: <20080616111532.C1D393C95E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-16 04:15:31 -0700 (Mon, 16 Jun 2008)
New Revision: 22368

Log:
file: bump version

Patch by Conrad Parker.


Modified:
   trunk/buildroot/package/file/file.mk


Changeset:
Modified: trunk/buildroot/package/file/file.mk
===================================================================
--- trunk/buildroot/package/file/file.mk	2008-06-16 09:49:47 UTC (rev 22367)
+++ trunk/buildroot/package/file/file.mk	2008-06-16 11:15:31 UTC (rev 22368)
@@ -3,7 +3,7 @@
 # file
 #
 #############################################################
-FILE_VERSION:=4.23
+FILE_VERSION:=4.24
 FILE_SOURCE:=file_$(FILE_VERSION).orig.tar.gz
 FILE_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/f/file
 FILE_SOURCE_DIR:=$(BUILD_DIR)/file-$(FILE_VERSION)
