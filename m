From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Mar 2009 21:21:45 +0000 (UTC)
Subject: [Buildroot] svn commit: [25731] trunk/buildroot/package/freetype
Message-ID: <20090318212145.558F47763E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-18 21:21:44 +0000 (Wed, 18 Mar 2009)
New Revision: 25731

Log:
freetype: fixup help text indentation

Modified:
   trunk/buildroot/package/freetype/Config.in


Changeset:
Modified: trunk/buildroot/package/freetype/Config.in
===================================================================
--- trunk/buildroot/package/freetype/Config.in	2009-03-18 21:21:39 UTC (rev 25730)
+++ trunk/buildroot/package/freetype/Config.in	2009-03-18 21:21:44 UTC (rev 25731)
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_FREETYPE
 	bool "freetype"
 	help
-	a free, high-quality and portable font engine.
+	  a free, high-quality and portable font engine.
 
-	http://www.freetype.org/
+	  http://www.freetype.org/
 
 choice
 	prompt "Freetype Version"
