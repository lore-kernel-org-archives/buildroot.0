From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 27 Apr 2009 08:36:04 +0000 (UTC)
Subject: [Buildroot] svn commit: [26217] trunk/buildroot/package/libglib2
Message-ID: <20090427083604.F01EB7745E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-27 08:36:04 +0000 (Mon, 27 Apr 2009)
New Revision: 26217

Log:
libglib2: bump version

Patch by Sven Neumann <s.neumann@phase-zero.de>, closes #279.

Modified:
   trunk/buildroot/package/libglib2/libglib2.mk


Changeset:
Modified: trunk/buildroot/package/libglib2/libglib2.mk
===================================================================
--- trunk/buildroot/package/libglib2/libglib2.mk	2009-04-26 23:25:36 UTC (rev 26216)
+++ trunk/buildroot/package/libglib2/libglib2.mk	2009-04-27 08:36:04 UTC (rev 26217)
@@ -3,8 +3,8 @@
 # libglib2
 #
 #############################################################
-LIBGLIB2_VERSION_MAJOR = 2.18
-LIBGLIB2_VERSION_MINOR = 4
+LIBGLIB2_VERSION_MAJOR = 2.20
+LIBGLIB2_VERSION_MINOR = 1
 LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).$(LIBGLIB2_VERSION_MINOR)
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.bz2
 LIBGLIB2_SITE = http://ftp.gtk.org/pub/glib/$(LIBGLIB2_VERSION_MAJOR)
