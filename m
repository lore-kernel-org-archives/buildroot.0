From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 12 Feb 2009 08:51:17 +0000 (UTC)
Subject: [Buildroot] svn commit: tags/buildroot_2009.02
Message-ID: <20090212085117.45D3876440@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-12 08:51:16 +0000 (Thu, 12 Feb 2009)
New Revision: 25303

Log:
buildroot: fix version for 2009.02

Modified:
   tags/buildroot_2009.02/Config.in


Changeset:
Modified: tags/buildroot_2009.02/Config.in
===================================================================
--- tags/buildroot_2009.02/Config.in	2009-02-12 08:48:20 UTC (rev 25302)
+++ tags/buildroot_2009.02/Config.in	2009-02-12 08:51:16 UTC (rev 25303)
@@ -8,7 +8,7 @@
 
 config BR2_VERSION
 	string
-	default "2009.02-svn"
+	default "2009.02"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
