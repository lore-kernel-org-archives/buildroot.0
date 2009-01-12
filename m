From: laird at uclibc.org <laird@uclibc.org>
Date: Mon, 12 Jan 2009 12:45:48 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libpng
Message-ID: <20090112124548.E33A3766E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2009-01-12 12:45:48 +0000 (Mon, 12 Jan 2009)
New Revision: 24793

Log:
package/libpng/libpng.mk: Remove the unnecessary --without-x option

Signed-off-by: Daniel Laird <daniel.j.laird@nxp.com>



Modified:
   trunk/buildroot/package/libpng/libpng.mk


Changeset:
Modified: trunk/buildroot/package/libpng/libpng.mk
===================================================================
--- trunk/buildroot/package/libpng/libpng.mk	2009-01-12 12:40:48 UTC (rev 24792)
+++ trunk/buildroot/package/libpng/libpng.mk	2009-01-12 12:45:48 UTC (rev 24793)
@@ -15,9 +15,7 @@
 		ac_cv_func_malloc_0_nonnull=yes \
 		ac_cv_func_calloc_0_nonnull=yes \
 		ac_cv_func_realloc_0_nonnull=yes
-LIBPNG_CONF_OPT = \
-		--without-libpng-compat \
-		--without-x
+LIBPNG_CONF_OPT = --without-libpng-compat
 LIBPNG_DEPENDENCIES = uclibc pkgconfig zlib
 
 $(eval $(call AUTOTARGETS,package,libpng))
