From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 29 Jan 2009 17:23:35 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device
Message-ID: <20090129172336.6C70176D75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-29 17:23:35 +0000 (Thu, 29 Jan 2009)
New Revision: 25127

Log:
Remove Soekris BSP which only provide support for linux-2.4

Removed:
   trunk/buildroot/target/device/Soekris/

Modified:
   trunk/buildroot/target/device/Config.in


Changeset:
Modified: trunk/buildroot/target/device/Config.in
===================================================================
--- trunk/buildroot/target/device/Config.in	2009-01-29 17:22:49 UTC (rev 25126)
+++ trunk/buildroot/target/device/Config.in	2009-01-29 17:23:35 UTC (rev 25127)
@@ -8,7 +8,6 @@
 source "target/device/ARMLTD/Config.in"
 source "target/device/Atmel/Config.in"
 source "target/device/KwikByte/Config.in"
-source "target/device/Soekris/Config.in"
 source "target/device/valka/Config.in"
 source "target/device/Via/Config.in"
 
