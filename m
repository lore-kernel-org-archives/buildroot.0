From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:08:42 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/file
Message-ID: <20080306180842.9B3B61201D2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:08:42 -0800 (Thu, 06 Mar 2008)
New Revision: 21190

Log:
updated file version

Modified:
   trunk/buildroot/package/file/file.mk


Changeset:
Modified: trunk/buildroot/package/file/file.mk
===================================================================
--- trunk/buildroot/package/file/file.mk	2008-03-06 18:08:14 UTC (rev 21189)
+++ trunk/buildroot/package/file/file.mk	2008-03-06 18:08:42 UTC (rev 21190)
@@ -3,7 +3,7 @@
 # file
 #
 #############################################################
-FILE_VERSION:=4.21
+FILE_VERSION:=4.23
 FILE_SOURCE:=file_$(FILE_VERSION).orig.tar.gz
 FILE_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/f/file
 FILE_SOURCE_DIR:=$(BUILD_DIR)/file-$(FILE_VERSION)
