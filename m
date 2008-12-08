From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  8 Dec 2008 05:42:01 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/freetype
Message-ID: <20081208134201.C6C093C78E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-08 05:42:01 -0800 (Mon, 08 Dec 2008)
New Revision: 24321

Log:
package/freetype: default to 2.3.7

Modified:
   trunk/buildroot/package/freetype/Config.in


Changeset:
Modified: trunk/buildroot/package/freetype/Config.in
===================================================================
--- trunk/buildroot/package/freetype/Config.in	2008-12-08 13:41:59 UTC (rev 24320)
+++ trunk/buildroot/package/freetype/Config.in	2008-12-08 13:42:01 UTC (rev 24321)
@@ -9,7 +9,7 @@
 choice
 	prompt "Freetype Version"
 	depends on BR2_PACKAGE_FREETYPE
-	default BR2_FREETYPE_VERSION_2_2_1
+	default BR2_FREETYPE_VERSION_2_3_7
 	help
 	  Select the version of Freetype you wish to use.
 
