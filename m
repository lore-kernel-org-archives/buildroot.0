From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 29 Dec 2008 10:09:55 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gmpc
Message-ID: <20081229100956.082E17697D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-29 10:09:55 +0000 (Mon, 29 Dec 2008)
New Revision: 24591

Log:
gmpc: fix typo

Thanks to Thomas for noticing.

Modified:
   trunk/buildroot/package/gmpc/Config.in


Changeset:
Modified: trunk/buildroot/package/gmpc/Config.in
===================================================================
--- trunk/buildroot/package/gmpc/Config.in	2008-12-29 10:09:50 UTC (rev 24590)
+++ trunk/buildroot/package/gmpc/Config.in	2008-12-29 10:09:55 UTC (rev 24591)
@@ -7,7 +7,7 @@
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_PKGCONFIG
 	select BR2_PACKAGE_LIBMPD
-	select BR2_PACKAGE_LIBCUR
+	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBGLADE
 	select BR2_PACKAGE_LIBXML2
 	help
