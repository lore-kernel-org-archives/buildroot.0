From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 31 Jan 2009 21:38:51 +0000 (UTC)
Subject: [Buildroot] svn commit: tags/buildroot_2009.02_rc3
Message-ID: <20090131213851.2C5A57621A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-31 21:38:50 +0000 (Sat, 31 Jan 2009)
New Revision: 25198

Log:
buildroot: fix version for 2009.02-rc3


Modified:
   tags/buildroot_2009.02_rc3/Config.in


Changeset:
Modified: tags/buildroot_2009.02_rc3/Config.in
===================================================================
--- tags/buildroot_2009.02_rc3/Config.in	2009-01-31 21:27:33 UTC (rev 25197)
+++ tags/buildroot_2009.02_rc3/Config.in	2009-01-31 21:38:50 UTC (rev 25198)
@@ -8,7 +8,7 @@
 
 config BR2_VERSION
 	string
-	default "2009.02-svn"
+	default "2009.02-rc3"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
