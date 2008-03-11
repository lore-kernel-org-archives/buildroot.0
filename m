From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Tue, 11 Mar 2008 12:28:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target
Message-ID: <20080311192810.C9D0112015B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-11 12:28:06 -0700 (Tue, 11 Mar 2008)
New Revision: 21307

Log:
removed duplicate config.in reference

Modified:
   trunk/buildroot/target/Config.in


Changeset:
Modified: trunk/buildroot/target/Config.in
===================================================================
--- trunk/buildroot/target/Config.in	2008-03-11 19:13:38 UTC (rev 21306)
+++ trunk/buildroot/target/Config.in	2008-03-11 19:28:06 UTC (rev 21307)
@@ -19,7 +19,6 @@
 source "target/x86/syslinux/Config.in"
 source "target/powerpc/yaboot/Config.in"
 source "target/u-boot/Config.in"
-source "target/device/Atmel/u-boot/Config.in"
 endmenu
 
 menu "Kernel"
