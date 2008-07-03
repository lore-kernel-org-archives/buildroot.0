From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu,  3 Jul 2008 01:29:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device
Message-ID: <20080703082927.2A7863C2C9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-03 01:29:26 -0700 (Thu, 03 Jul 2008)
New Revision: 22619

Log:
Enable KB9202 board in Config

Modified:
   trunk/buildroot/target/device/Config.in


Changeset:
Modified: trunk/buildroot/target/device/Config.in
===================================================================
--- trunk/buildroot/target/device/Config.in	2008-07-03 08:27:50 UTC (rev 22618)
+++ trunk/buildroot/target/device/Config.in	2008-07-03 08:29:26 UTC (rev 22619)
@@ -9,6 +9,7 @@
 source "target/device/Atmel/Config.in"
 source "target/device/Hitachi/Config.in"
 source "target/device/jp/Config.in"
+source "target/device/KwikByte/Config.in"
 source "target/device/Sharp/Config.in"
 source "target/device/Soekris/Config.in"
 source "target/device/valka/Config.in"
