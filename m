From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 27 Aug 2008 13:19:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/xpdf
Message-ID: <20080827201944.44274F8030@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-27 13:19:43 -0700 (Wed, 27 Aug 2008)
New Revision: 23266

Log:
xpdf: fix long help text lines

Modified:
   trunk/buildroot/package/xpdf/Config.in


Changeset:
Modified: trunk/buildroot/package/xpdf/Config.in
===================================================================
--- trunk/buildroot/package/xpdf/Config.in	2008-08-27 20:19:40 UTC (rev 23265)
+++ trunk/buildroot/package/xpdf/Config.in	2008-08-27 20:19:43 UTC (rev 23266)
@@ -2,6 +2,7 @@
 	bool "xpdf"
 	select BR2_PACKAGE_OPENMOTIF
 	help
-	  Xpdf is an open source viewer for Portable Document Format (PDF) files.
+	  Xpdf is an open source viewer for Portable Document Format
+	  (PDF) files.
 
 	  ftp://ftp.foolabs.com/pub/xpdf
