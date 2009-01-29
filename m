From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 29 Jan 2009 17:26:09 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device
Message-ID: <20090129172609.C4B0D76D75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-29 17:26:08 +0000 (Thu, 29 Jan 2009)
New Revision: 25128

Log:
Remove Via BSP which only provide support for linux-2.4

Removed:
   trunk/buildroot/target/device/Via/

Modified:
   trunk/buildroot/target/device/Config.in


Changeset:
Modified: trunk/buildroot/target/device/Config.in
===================================================================
--- trunk/buildroot/target/device/Config.in	2009-01-29 17:23:35 UTC (rev 25127)
+++ trunk/buildroot/target/device/Config.in	2009-01-29 17:26:08 UTC (rev 25128)
@@ -9,7 +9,6 @@
 source "target/device/Atmel/Config.in"
 source "target/device/KwikByte/Config.in"
 source "target/device/valka/Config.in"
-source "target/device/Via/Config.in"
 
 comment "Generic Architecture support"
 
