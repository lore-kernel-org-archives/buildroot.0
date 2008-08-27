From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 27 Aug 2008 13:19:09 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
Message-ID: <20080827201909.DC0063C852@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-27 13:19:09 -0700 (Wed, 27 Aug 2008)
New Revision: 23256

Log:
qtopia: fix long help text lines

Modified:
   trunk/buildroot/package/qtopia4/Config.in


Changeset:
Modified: trunk/buildroot/package/qtopia4/Config.in
===================================================================
--- trunk/buildroot/package/qtopia4/Config.in	2008-08-27 20:19:04 UTC (rev 23255)
+++ trunk/buildroot/package/qtopia4/Config.in	2008-08-27 20:19:09 UTC (rev 23256)
@@ -69,15 +69,16 @@
 	default ""
 	depends on BR2_PACKAGE_QTOPIA4 && BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMMERCIAL
 	help
-	  Commercial users can download their source directly by providing a username.
+	  Commercial users can download their source directly by
+	  providing a username.
 
-
 config BR2_PACKAGE_QTOPIA4_COMMERCIAL_PASSWORD
 	string "Qtopia Core 4 Commercial License Password"
 	default ""
 	depends on BR2_PACKAGE_QTOPIA4 && BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMMERCIAL
 	help
-	  Commercial users can download their source directly by providing a password.
+	  Commercial users can download their source directly by
+	  providing a password.
 
 config BR2_PACKAGE_QTOPIA4_QT3SUPPORT
 	bool "Compatibility with Qt3"
