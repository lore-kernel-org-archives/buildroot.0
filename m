From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 21 Aug 2007 03:32:56 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070821103256.0BB45A60F9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-21 03:32:55 -0700 (Tue, 21 Aug 2007)
New Revision: 19603

Log:
- 4.2.1 obsoletes 4.2.0


Modified:
   trunk/buildroot/toolchain/gcc/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2007-08-21 10:28:43 UTC (rev 19602)
+++ trunk/buildroot/toolchain/gcc/Config.in	2007-08-21 10:32:55 UTC (rev 19603)
@@ -69,7 +69,7 @@
 		bool "gcc 4.1.2"
 
 	config BR2_GCC_VERSION_4_2_0
-		depends !BR2_avr32 && !BR2_nios2
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "gcc 4.2.0"
 
 	config BR2_GCC_VERSION_4_2_1
