From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 11 Mar 2009 20:32:45 +0000 (UTC)
Subject: [Buildroot] svn commit: [25615] trunk/buildroot/package/dropbear
Message-ID: <20090311203245.126177645B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-11 20:32:44 +0000 (Wed, 11 Mar 2009)
New Revision: 25615

Log:
dropbear: needs zlib, so select it

Modified:
   trunk/buildroot/package/dropbear/Config.in


Changeset:
Modified: trunk/buildroot/package/dropbear/Config.in
===================================================================
--- trunk/buildroot/package/dropbear/Config.in	2009-03-11 20:32:39 UTC (rev 25614)
+++ trunk/buildroot/package/dropbear/Config.in	2009-03-11 20:32:44 UTC (rev 25615)
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DROPBEAR
 	bool "dropbear"
+	select BR2_PACKAGE_ZLIB
 	help
 	  A small SSH 2 server designed for small memory environments.
 
