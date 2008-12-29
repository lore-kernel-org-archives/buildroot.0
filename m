From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 29 Dec 2008 11:05:04 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pango
Message-ID: <20081229110505.1260D76C21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-29 11:05:04 +0000 (Mon, 29 Dec 2008)
New Revision: 24593

Log:
pango: fix download url

Reported by Berns.

Modified:
   trunk/buildroot/package/pango/pango.mk


Changeset:
Modified: trunk/buildroot/package/pango/pango.mk
===================================================================
--- trunk/buildroot/package/pango/pango.mk	2008-12-29 11:05:00 UTC (rev 24592)
+++ trunk/buildroot/package/pango/pango.mk	2008-12-29 11:05:04 UTC (rev 24593)
@@ -5,7 +5,7 @@
 #############################################################
 PANGO_VERSION = 1.20.5
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.bz2
-PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/1.19
+PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/1.20
 PANGO_AUTORECONF = YES
 PANGO_INSTALL_STAGING = YES
 PANGO_INSTALL_TARGET = YES
