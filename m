From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 16 Jan 2009 14:13:47 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20090116141347.DD52277567@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-16 14:13:46 +0000 (Fri, 16 Jan 2009)
New Revision: 24880

Log:
toolchain/gcc: default to 4.3.2 for !AVR32

Modified:
   trunk/buildroot/toolchain/gcc/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2009-01-16 13:56:23 UTC (rev 24879)
+++ trunk/buildroot/toolchain/gcc/Config.in	2009-01-16 14:13:46 UTC (rev 24880)
@@ -4,7 +4,7 @@
 
 choice
 	prompt "GCC compiler Version"
-	default BR2_GCC_VERSION_4_2_4 if !BR2_avr32
+	default BR2_GCC_VERSION_4_3_2 if !BR2_avr32
 	default BR2_GCC_VERSION_4_2_3 if BR2_avr32
 	help
 	  Select the version of gcc you wish to use.
