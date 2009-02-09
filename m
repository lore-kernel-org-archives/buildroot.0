From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  9 Feb 2009 15:52:49 +0000 (UTC)
Subject: [Buildroot] svn commit: tags/buildroot_2009.02_rc4
Message-ID: <20090209155250.0D38D7644E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-09 15:52:49 +0000 (Mon, 09 Feb 2009)
New Revision: 25277

Log:
buildroot: fix version for 2009.02-rc4

Modified:
   tags/buildroot_2009.02_rc4/Config.in


Changeset:
Modified: tags/buildroot_2009.02_rc4/Config.in
===================================================================
--- tags/buildroot_2009.02_rc4/Config.in	2009-02-09 15:41:57 UTC (rev 25276)
+++ tags/buildroot_2009.02_rc4/Config.in	2009-02-09 15:52:49 UTC (rev 25277)
@@ -8,7 +8,7 @@
 
 config BR2_VERSION
 	string
-	default "2009.02-svn"
+	default "2009.02-rc4"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
