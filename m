From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  8 Jan 2009 08:27:46 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/neon
Message-ID: <20090108082746.4BFC077106@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-08 08:27:45 +0000 (Thu, 08 Jan 2009)
New Revision: 24718

Log:
neon: s/exapt/expat/

Modified:
   trunk/buildroot/package/neon/Config.in


Changeset:
Modified: trunk/buildroot/package/neon/Config.in
===================================================================
--- trunk/buildroot/package/neon/Config.in	2009-01-08 08:27:18 UTC (rev 24717)
+++ trunk/buildroot/package/neon/Config.in	2009-01-08 08:27:45 UTC (rev 24718)
@@ -19,7 +19,7 @@
 	depends on BR2_PACKAGE_NEON
 	help
 	  Select which XML library to use...
-	  expat      use exapt
+	  expat      use expat
 	  libxml2    use libxml2
 	  none       do not build with XML support
 
@@ -27,7 +27,7 @@
 	bool "expat"
 	depends on BR2_PACKAGE_EXPAT
 	help
-	  expat      use exapt, a library for parsing XML.
+	  expat      use expat, a library for parsing XML.
 
 config BR2_PACKAGE_NEON_LIBXML2
 	bool "libxml2"
