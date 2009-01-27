From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 27 Jan 2009 15:02:26 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/icu
Message-ID: <20090127150226.D1D947709E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-27 15:02:25 +0000 (Tue, 27 Jan 2009)
New Revision: 25077

Log:
icu: add project url to help text

Modified:
   trunk/buildroot/package/icu/Config.in


Changeset:
Modified: trunk/buildroot/package/icu/Config.in
===================================================================
--- trunk/buildroot/package/icu/Config.in	2009-01-27 15:02:22 UTC (rev 25076)
+++ trunk/buildroot/package/icu/Config.in	2009-01-27 15:02:25 UTC (rev 25077)
@@ -4,5 +4,7 @@
 	help
 	  International Components for Unicode.
 
+	  http://icu-project.org/
+
 comment "icu requires a toolchain with C++ support enabled"
 	depends on !BR2_INSTALL_LIBSTDCPP
