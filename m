From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 23 Jan 2009 20:56:08 +0000 (UTC)
Subject: [Buildroot] svn commit: tags/buildroot_2009.02_rc2
Message-ID: <20090123205608.6D81E769CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-23 20:56:07 +0000 (Fri, 23 Jan 2009)
New Revision: 24990

Log:
buildroot: fix version for 2009.02-rc2

Modified:
   tags/buildroot_2009.02_rc2/Config.in


Changeset:
Modified: tags/buildroot_2009.02_rc2/Config.in
===================================================================
--- tags/buildroot_2009.02_rc2/Config.in	2009-01-23 20:52:59 UTC (rev 24989)
+++ tags/buildroot_2009.02_rc2/Config.in	2009-01-23 20:56:07 UTC (rev 24990)
@@ -8,7 +8,7 @@
 
 config BR2_VERSION
 	string
-	default "2009.02-svn"
+	default "2009.02-rc2"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
