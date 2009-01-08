From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  8 Jan 2009 08:27:22 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/freetype
Message-ID: <20090108082722.4046B77106@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-08 08:27:18 +0000 (Thu, 08 Jan 2009)
New Revision: 24717

Log:
freetype: mark ancient 2.2 version as deprecated

Modified:
   trunk/buildroot/package/freetype/Config.in


Changeset:
Modified: trunk/buildroot/package/freetype/Config.in
===================================================================
--- trunk/buildroot/package/freetype/Config.in	2009-01-08 03:35:47 UTC (rev 24716)
+++ trunk/buildroot/package/freetype/Config.in	2009-01-08 08:27:18 UTC (rev 24717)
@@ -15,6 +15,7 @@
 
 	config BR2_FREETYPE_VERSION_2_2_1
 		bool "Freetype 2.2.1"
+		depends on BR2_DEPRECATED
 
 	config BR2_FREETYPE_VERSION_2_3_7
 		bool "Freetype 2.3.7"
