From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 16 Jan 2009 19:30:21 +0000 (UTC)
Subject: [Buildroot] svn commit: tags/buildroot_2009.02_rc1
Message-ID: <20090116193022.1E05277571@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-16 19:30:21 +0000 (Fri, 16 Jan 2009)
New Revision: 24885

Log:
buildroot: fix version for 2009.02-rc2

Modified:
   tags/buildroot_2009.02_rc1/Config.in


Changeset:
Modified: tags/buildroot_2009.02_rc1/Config.in
===================================================================
--- tags/buildroot_2009.02_rc1/Config.in	2009-01-16 19:28:06 UTC (rev 24884)
+++ tags/buildroot_2009.02_rc1/Config.in	2009-01-16 19:30:21 UTC (rev 24885)
@@ -8,7 +8,7 @@
 
 config BR2_VERSION
 	string
-	default "2009.02-svn"
+	default "2009.02-rc1"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
