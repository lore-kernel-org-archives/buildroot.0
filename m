From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 31 Mar 2009 14:29:38 +0000 (UTC)
Subject: [Buildroot] svn commit: [25907] trunk/buildroot/package/qtopia4
Message-ID: <20090331142938.59FCB771A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-31 14:29:38 +0000 (Tue, 31 Mar 2009)
New Revision: 25907

Log:
qtopia4: default to the ppc config for powerpc builds

Modified:
   trunk/buildroot/package/qtopia4/Config.in


Changeset:
Modified: trunk/buildroot/package/qtopia4/Config.in
===================================================================
--- trunk/buildroot/package/qtopia4/Config.in	2009-03-31 14:29:30 UTC (rev 25906)
+++ trunk/buildroot/package/qtopia4/Config.in	2009-03-31 14:29:38 UTC (rev 25907)
@@ -244,12 +244,12 @@
 	default "x86_64"	if BR2_x86_64
 	default "mips"	if BR2_mips
 	default "mips"	if BR2_mipsel
+	default "ppc"	if BR2_powerpc
 # Not that I really believe these will work..
 	default "generic"	if BR2_alpha
 	default "generic"	if BR2_chris
 	default "generic"	if BR2_m68k
 	default "generic"	if BR2_nios2
-	default "generic"	if BR2_powerpc
 	default "generic"	if BR2_sh
 	default "generic"	if BR2_sh64
 	default "generic"	if BR2_sparc
