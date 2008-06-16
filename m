From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 16 Jun 2008 02:49:49 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/php
Message-ID: <20080616094949.6B2C63C8A5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-16 02:49:47 -0700 (Mon, 16 Jun 2008)
New Revision: 22367

Log:
php: fix s/EXIT/EXT/ typo in simplexml select


Modified:
   trunk/buildroot/package/php/Config.ext


Changeset:
Modified: trunk/buildroot/package/php/Config.ext
===================================================================
--- trunk/buildroot/package/php/Config.ext	2008-06-16 07:32:40 UTC (rev 22366)
+++ trunk/buildroot/package/php/Config.ext	2008-06-16 09:49:47 UTC (rev 22367)
@@ -45,7 +45,7 @@
 config BR2_PACKAGE_PHP_EXT_SIMPLEXML
 	bool "simplexml"
 	depends on BR2_PACKAGE_PHP
-	select BR2_PACKAGE_PHP_EXIT_LIBXML2
+	select BR2_PACKAGE_PHP_EXT_LIBXML2
 	help
 	  SimpleXML support
 
