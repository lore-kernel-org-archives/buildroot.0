From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  9 Mar 2009 10:26:04 +0000 (UTC)
Subject: [Buildroot] svn commit: [25584] trunk/buildroot/package/libglib2
Message-ID: <20090309102604.D215D7656F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-09 10:26:04 +0000 (Mon, 09 Mar 2009)
New Revision: 25584

Log:
libglib2: bump version

Patch by Sven Neumann <s.neumann@phase-zero.de>

Closes #37.

Modified:
   trunk/buildroot/package/libglib2/libglib2.mk


Changeset:
Modified: trunk/buildroot/package/libglib2/libglib2.mk
===================================================================
--- trunk/buildroot/package/libglib2/libglib2.mk	2009-03-09 09:53:41 UTC (rev 25583)
+++ trunk/buildroot/package/libglib2/libglib2.mk	2009-03-09 10:26:04 UTC (rev 25584)
@@ -3,13 +3,14 @@
 # libglib2
 #
 #############################################################
-LIBGLIB2_VERSION_MAJOR = 2.16
-LIBGLIB2_VERSION_MINOR = 6
+LIBGLIB2_VERSION_MAJOR = 2.18
+LIBGLIB2_VERSION_MINOR = 4
 LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).$(LIBGLIB2_VERSION_MINOR)
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.bz2
 LIBGLIB2_SITE = http://ftp.gtk.org/pub/glib/$(LIBGLIB2_VERSION_MAJOR)
 
 LIBGLIB2_AUTORECONF = NO
+LIBGLIB2_LIBTOOL_PATCH = NO
 LIBGLIB2_INSTALL_STAGING = YES
 LIBGLIB2_INSTALL_TARGET = YES
 LIBGLIB2_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
