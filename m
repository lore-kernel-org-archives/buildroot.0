From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 26 Dec 2008 22:29:26 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/libmpd
Message-ID: <20081226222926.C742476F25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-26 22:29:26 +0000 (Fri, 26 Dec 2008)
New Revision: 24561

Log:
libmpd: get rid of < glib2.16 workaround

Removed:
   trunk/buildroot/package/multimedia/libmpd/libmpd-0.17.0-accept-glib-2.15.patch


Changeset:
Deleted: trunk/buildroot/package/multimedia/libmpd/libmpd-0.17.0-accept-glib-2.15.patch
===================================================================
--- trunk/buildroot/package/multimedia/libmpd/libmpd-0.17.0-accept-glib-2.15.patch	2008-12-26 22:29:19 UTC (rev 24560)
+++ trunk/buildroot/package/multimedia/libmpd/libmpd-0.17.0-accept-glib-2.15.patch	2008-12-26 22:29:26 UTC (rev 24561)
@@ -1,17 +0,0 @@
----
- configure.ac |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: libmpd-0.17.0/configure.ac
-===================================================================
---- libmpd-0.17.0.orig/configure.ac
-+++ libmpd-0.17.0/configure.ac
-@@ -25,7 +25,7 @@
- AC_SUBST(EXTRA_CFLAGS)
- AC_SUBST(EXTRA_LDFLAGS)   
- 
--PKG_CHECK_MODULES([glib], glib-2.0 >= 2.16)
-+PKG_CHECK_MODULES([glib], glib-2.0 >= 2.15)
- AC_SUBST(glib_LIBS)
- AC_SUBST(glib_CFLAGS)
- 
