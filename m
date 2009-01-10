From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 10 Jan 2009 00:21:35 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/multimedia/libsndfile
Message-ID: <20090110002135.C74AC7697D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-10 00:21:35 +0000 (Sat, 10 Jan 2009)
New Revision: 24737

Log:
Use correct path to source for libsndfile

Modified:
   trunk/buildroot/package/multimedia/libsndfile/libsndfile.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/libsndfile/libsndfile.mk
===================================================================
--- trunk/buildroot/package/multimedia/libsndfile/libsndfile.mk	2009-01-10 00:20:05 UTC (rev 24736)
+++ trunk/buildroot/package/multimedia/libsndfile/libsndfile.mk	2009-01-10 00:21:35 UTC (rev 24737)
@@ -5,7 +5,7 @@
 #############################################################
 LIBSNDFILE_VERSION:=1.0.17
 LIBSNDFILE_SOURCE:=libsndfile-$(LIBSNDFILE_VERSION).tar.gz
-LIBSNDFILE_SITE:=http://www.mega-nerd.com/libsndfile/$(LIBUSB_SOURCE)
+LIBSNDFILE_SITE:=http://www.mega-nerd.com/libsndfile
 LIBSNDFILE_DIR:=$(BUILD_DIR)/libsndfile-$(LIBSNDFILE_VERSION)
 LIBSNDFILE_BINARY:=src/.libs/libsndfile.so
 LIBSNDFILE_TARGET_BINARY:=usr/lib/libsndfile.so
