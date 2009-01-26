From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 26 Jan 2009 00:14:20 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ltt
Message-ID: <20090126001420.326E276D28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-26 00:14:19 +0000 (Mon, 26 Jan 2009)
New Revision: 25038

Log:
Deprecate ltt, package is obsolete and replaced by ltt-ng

Modified:
   trunk/buildroot/package/ltt/Config.in


Changeset:
Modified: trunk/buildroot/package/ltt/Config.in
===================================================================
--- trunk/buildroot/package/ltt/Config.in	2009-01-26 00:13:29 UTC (rev 25037)
+++ trunk/buildroot/package/ltt/Config.in	2009-01-26 00:14:19 UTC (rev 25038)
@@ -1,7 +1,10 @@
 config BR2_PACKAGE_LTT
 	bool "LTT (Linux Trace Toolkit)"
+	depends on BR2_DEPRECATED
 	help
 	  A suite of tools designed to extract program execution
 	  details from the Linux operating system and interpret them.
 
 	  http://www.opersys.com/LTT/
+	  The package is obsolete and has been replaced by ltt-ng
+
