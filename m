From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Wed, 31 Dec 2008 18:27:31 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/rpm
Message-ID: <20081231182731.E482376FDC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-12-31 18:27:31 +0000 (Wed, 31 Dec 2008)
New Revision: 24631

Log:
* Select zlib support in neon for rpm


Modified:
   trunk/buildroot/package/rpm/Config.in


Changeset:
Modified: trunk/buildroot/package/rpm/Config.in
===================================================================
--- trunk/buildroot/package/rpm/Config.in	2008-12-31 18:25:23 UTC (rev 24630)
+++ trunk/buildroot/package/rpm/Config.in	2008-12-31 18:27:31 UTC (rev 24631)
@@ -3,8 +3,9 @@
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_BEECRYPT
+	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_NEON
-	select BR2_PACKAGE_POPT
+	select BR2_PACKAGE_NEON_ZLIB
 	select BR2_PACKAGE_NEON_EXPAT 	if BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_NEON_LIBXML2	if BR2_PACKAGE_LIBXML2
 	help
