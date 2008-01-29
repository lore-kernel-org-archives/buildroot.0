From: Michael Hirsch <M.Hirsch@phase-zero.de>
Date: Tue, 29 Jan 2008 12:29:45 +0100
Subject: [Buildroot] [PATCH]update file version to 4.23
Message-ID: <479F0E29.6080309@phase-zero.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

old version 4.21 was removed from debian server


Index: package/file/file.mk
===================================================================
--- package/file/file.mk        (revision 20913)
+++ package/file/file.mk        (working copy)
@@ -3,7 +3,7 @@
# file
#
#############################################################
-FILE_VERSION:=4.21
+FILE_VERSION:=4.23
FILE_SOURCE:=file_$(FILE_VERSION).orig.tar.gz
FILE_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/f/file
FILE_SOURCE_DIR:=$(BUILD_DIR)/file-$(FILE_VERSION)
