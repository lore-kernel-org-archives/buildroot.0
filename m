From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 24 Jan 2007 14:22:12 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device:  Atmel
Message-ID: <20070124222212.A2DBA485C1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-24 14:22:11 -0800 (Wed, 24 Jan 2007)
New Revision: 17511

Log:
- Prepatory patch for new Atmel targets boards
  Rearrange in Alphabetical order (Ulf Samuelsson)


Added:
   trunk/buildroot/target/device/Atmel/
   trunk/buildroot/target/device/Atmel/Config.in

Modified:
   trunk/buildroot/target/device/Config.in


Changeset:
Added: trunk/buildroot/target/device/Atmel/Config.in
===================================================================
--- trunk/buildroot/target/device/Atmel/Config.in	                        (rev 0)
+++ trunk/buildroot/target/device/Atmel/Config.in	2007-01-24 22:22:11 UTC (rev 17511)
@@ -0,0 +1,5 @@
+menu "Atmel Target"
+
+comment "Add Atmel Target here"
+
+endmenu

Modified: trunk/buildroot/target/device/Config.in
===================================================================
--- trunk/buildroot/target/device/Config.in	2007-01-24 22:12:35 UTC (rev 17510)
+++ trunk/buildroot/target/device/Config.in	2007-01-24 22:22:11 UTC (rev 17511)
@@ -1,11 +1,12 @@
 menu "Board Support Options"
 
+source "target/device/AMD/Config.in"
+source "target/device/Atmel/Config.in"
+source "target/device/Hitachi/Config.in"
+source "target/device/jp/Config.in"
+source "target/device/Sharp/Config.in"
 source "target/device/Soekris/Config.in"
-source "target/device/Hitachi/Config.in"
-source "target/device/AMD/Config.in"
 source "target/device/Via/Config.in"
-source "target/device/Sharp/Config.in"
-source "target/device/jp/Config.in"
 source "target/device/x86/Config.in"
 
 # This must be last
