From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 10 Jul 2008 03:12:21 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fuse
Message-ID: <20080710101221.507CE3C7FF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-10 03:12:20 -0700 (Thu, 10 Jul 2008)
New Revision: 22752

Log:
fuse: use BR2_SOURCEFORGE_MIRROR

Modified:
   trunk/buildroot/package/fuse/libfuse.mk


Changeset:
Modified: trunk/buildroot/package/fuse/libfuse.mk
===================================================================
--- trunk/buildroot/package/fuse/libfuse.mk	2008-07-10 10:12:15 UTC (rev 22751)
+++ trunk/buildroot/package/fuse/libfuse.mk	2008-07-10 10:12:20 UTC (rev 22752)
@@ -5,7 +5,7 @@
 #############################################################
 LIBFUSE_VERSION:=2.7.0
 LIBFUSE_SOURCE:=fuse-$(LIBFUSE_VERSION).tar.gz
-LIBFUSE_SITE:=http://downloads.sourceforge.net/fuse
+LIBFUSE_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/fuse/
 LIBFUSE_DIR:=$(BUILD_DIR)/fuse-$(LIBFUSE_VERSION)
 LIBFUSE_BINARY:=libfuse
 $(DL_DIR)/$(LIBFUSE_SOURCE):
