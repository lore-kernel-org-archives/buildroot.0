From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 23 Aug 2008 06:08:28 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libxml2
Message-ID: <20080823130828.CB1E3F8008@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-23 06:08:28 -0700 (Sat, 23 Aug 2008)
New Revision: 23183

Log:
libxml2: remove unused BR2_PACKAGE_LIBXML2_TARGET_HEADERS option

Modified:
   trunk/buildroot/package/libxml2/Config.in


Changeset:
Modified: trunk/buildroot/package/libxml2/Config.in
===================================================================
--- trunk/buildroot/package/libxml2/Config.in	2008-08-22 14:42:00 UTC (rev 23182)
+++ trunk/buildroot/package/libxml2/Config.in	2008-08-23 13:08:28 UTC (rev 23183)
@@ -3,11 +3,3 @@
 	help
 	  XML C Parser
 	  ftp://xmlsoft.org/libxml2
-
-config BR2_PACKAGE_LIBXML2_TARGET_HEADERS
-	bool "libxml2 target headers"
-	depends on BR2_PACKAGE_LIBXML2
-	help
-	  XML C Parser
-	  ftp://xmlsoft.org/libxml2
-
