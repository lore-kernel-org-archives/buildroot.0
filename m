From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 27 Dec 2008 14:36:33 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/libmpd
Message-ID: <20081227143633.4905176BD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-27 14:36:32 +0000 (Sat, 27 Dec 2008)
New Revision: 24569

Log:
libmpd: no need for autoreconf now we don't patch configure.ac anymore

Modified:
   trunk/buildroot/package/multimedia/libmpd/libmpd.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/libmpd/libmpd.mk
===================================================================
--- trunk/buildroot/package/multimedia/libmpd/libmpd.mk	2008-12-27 14:36:29 UTC (rev 24568)
+++ trunk/buildroot/package/multimedia/libmpd/libmpd.mk	2008-12-27 14:36:32 UTC (rev 24569)
@@ -6,7 +6,6 @@
 LIBMPD_VERSION = 0.17.0
 LIBMPD_SOURCE = libmpd-$(LIBMPD_VERSION).tar.gz
 LIBMPD_SITE = http://download.sarine.nl/download/Programs/gmpc/$(LIBMPD_VERSION)/
-LIBMPD_AUTORECONF = YES
 LIBMPD_INSTALL_STAGING = YES
 LIBMPD_LIBTOOL_PATCH = NO
 LIBMPD_DEPENDENCIES = libglib2
