From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon,  2 Feb 2009 07:20:56 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ltt
Message-ID: <20090202072056.A079E764CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-02-02 07:20:54 +0000 (Mon, 02 Feb 2009)
New Revision: 25216

Log:
Mark ltt as broken (all versions of tarball removed from SITE), package obsolete

Modified:
   trunk/buildroot/package/ltt/Config.in


Changeset:
Modified: trunk/buildroot/package/ltt/Config.in
===================================================================
--- trunk/buildroot/package/ltt/Config.in	2009-02-02 07:19:31 UTC (rev 25215)
+++ trunk/buildroot/package/ltt/Config.in	2009-02-02 07:20:54 UTC (rev 25216)
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LTT
 	bool "LTT (Linux Trace Toolkit)"
-	depends on BR2_DEPRECATED
+	depends on BROKEN
 	help
 	  A suite of tools designed to extract program execution
 	  details from the Linux operating system and interpret them.
