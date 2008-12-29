From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 29 Dec 2008 11:05:01 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libglib2
Message-ID: <20081229110501.3434676C21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-29 11:05:00 +0000 (Mon, 29 Dec 2008)
New Revision: 24592

Log:
libglib2: fix download url

Reported by Berns.

Modified:
   trunk/buildroot/package/libglib2/libglib2.mk


Changeset:
Modified: trunk/buildroot/package/libglib2/libglib2.mk
===================================================================
--- trunk/buildroot/package/libglib2/libglib2.mk	2008-12-29 10:09:55 UTC (rev 24591)
+++ trunk/buildroot/package/libglib2/libglib2.mk	2008-12-29 11:05:00 UTC (rev 24592)
@@ -5,7 +5,7 @@
 #############################################################
 LIBGLIB2_VERSION = 2.16.6
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.bz2
-LIBGLIB2_SITE = http://ftp.gtk.org/pub/glib/2.15
+LIBGLIB2_SITE = http://ftp.gtk.org/pub/glib/2.16
 LIBGLIB2_AUTORECONF = NO
 LIBGLIB2_INSTALL_STAGING = YES
 LIBGLIB2_INSTALL_TARGET = YES
