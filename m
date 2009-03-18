From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Mar 2009 21:21:34 +0000 (UTC)
Subject: [Buildroot] svn commit: [25729] trunk/buildroot/package/fontconfig
Message-ID: <20090318212134.9C2BC7763E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-18 21:21:34 +0000 (Wed, 18 Mar 2009)
New Revision: 25729

Log:
fontconfig: fixup help text indentation

Modified:
   trunk/buildroot/package/fontconfig/Config.in


Changeset:
Modified: trunk/buildroot/package/fontconfig/Config.in
===================================================================
--- trunk/buildroot/package/fontconfig/Config.in	2009-03-18 21:21:27 UTC (rev 25728)
+++ trunk/buildroot/package/fontconfig/Config.in	2009-03-18 21:21:34 UTC (rev 25729)
@@ -3,6 +3,6 @@
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_EXPAT
 	help
-	a library for font customization and configuration.
-	
-	http://www.fontconfig.org/
+	  a library for font customization and configuration.
+
+	  http://www.fontconfig.org/
