From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 29 Jan 2009 17:21:16 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device
Message-ID: <20090129172116.F10B076D75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-29 17:21:16 +0000 (Thu, 29 Jan 2009)
New Revision: 25124

Log:
Remove unneeded ARM architecure patch, just a clone of SAM9260 support

Removed:
   trunk/buildroot/target/device/ARM/

Modified:
   trunk/buildroot/target/device/Config.in


Changeset:
Modified: trunk/buildroot/target/device/Config.in
===================================================================
--- trunk/buildroot/target/device/Config.in	2009-01-29 17:05:12 UTC (rev 25123)
+++ trunk/buildroot/target/device/Config.in	2009-01-29 17:21:16 UTC (rev 25124)
@@ -7,8 +7,6 @@
 source "target/device/AMD/Config.in"
 source "target/device/ARMLTD/Config.in"
 source "target/device/Atmel/Config.in"
-source "target/device/Hitachi/Config.in"
-source "target/device/jp/Config.in"
 source "target/device/KwikByte/Config.in"
 source "target/device/Soekris/Config.in"
 source "target/device/valka/Config.in"
@@ -16,7 +14,6 @@
 
 comment "Generic Architecture support"
 
-source "target/device/ARM/Config.in"
 source "target/device/x86/Config.in"
 
 # This must be last
