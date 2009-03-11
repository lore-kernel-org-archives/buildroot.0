From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 11 Mar 2009 22:15:54 +0000 (UTC)
Subject: [Buildroot] svn commit: [25620] trunk/buildroot/package/automake
Message-ID: <20090311221554.5DABA7645B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-11 22:15:53 +0000 (Wed, 11 Mar 2009)
New Revision: 25620

Log:
automake: depends on autoconf, so select it

Modified:
   trunk/buildroot/package/automake/Config.in


Changeset:
Modified: trunk/buildroot/package/automake/Config.in
===================================================================
--- trunk/buildroot/package/automake/Config.in	2009-03-11 22:00:46 UTC (rev 25619)
+++ trunk/buildroot/package/automake/Config.in	2009-03-11 22:15:53 UTC (rev 25620)
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_AUTOMAKE
 	bool "automake"
+	select BR2_PACKAGE_AUTOCONF
 	help
 	  Tool for automatically generating Makefile's for input to
 	  configure scripts (made by autoconf).
