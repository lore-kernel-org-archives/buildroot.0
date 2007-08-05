From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  5 Aug 2007 05:10:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/file
Message-ID: <20070805121036.90099A45E7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-05 05:10:35 -0700 (Sun, 05 Aug 2007)
New Revision: 19404

Log:
- download disappeared, use debian instead


Modified:
   trunk/buildroot/package/file/file.mk


Changeset:
Modified: trunk/buildroot/package/file/file.mk
===================================================================
--- trunk/buildroot/package/file/file.mk	2007-08-03 14:17:21 UTC (rev 19403)
+++ trunk/buildroot/package/file/file.mk	2007-08-05 12:10:35 UTC (rev 19404)
@@ -4,8 +4,8 @@
 #
 #############################################################
 FILE_VERSION:=4.21
-FILE_SOURCE:=file-$(FILE_VERSION).tar.gz
-FILE_SITE:=ftp://ftp.astron.com/pub/file
+FILE_SOURCE:=file_$(FILE_VERSION).orig.tar.gz
+FILE_SITE:=http://ftp.debian.org/debian/pool/main/f/file
 FILE_SOURCE_DIR:=$(BUILD_DIR)/file-$(FILE_VERSION)
 FILE_DIR1:=$(TOOL_BUILD_DIR)/file-$(FILE_VERSION)-host
 FILE_DIR2:=$(BUILD_DIR)/file-$(FILE_VERSION)-target
