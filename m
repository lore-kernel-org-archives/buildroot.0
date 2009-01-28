From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 28 Jan 2009 20:09:04 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/xpdf
Message-ID: <20090128200904.4868B769CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-28 20:09:03 +0000 (Wed, 28 Jan 2009)
New Revision: 25106

Log:
xpdf: depends on freetype, so select it in kconfig as well

Modified:
   trunk/buildroot/package/xpdf/Config.in


Changeset:
Modified: trunk/buildroot/package/xpdf/Config.in
===================================================================
--- trunk/buildroot/package/xpdf/Config.in	2009-01-28 16:37:09 UTC (rev 25105)
+++ trunk/buildroot/package/xpdf/Config.in	2009-01-28 20:09:03 UTC (rev 25106)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_XPDF
 	bool "xpdf"
 	select BR2_PACKAGE_OPENMOTIF
+	select BR2_PACKAGE_FREETYPE
 	help
 	  Xpdf is an open source viewer for Portable Document Format
 	  (PDF) files.
