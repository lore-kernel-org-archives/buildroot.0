From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  7 Jul 2007 16:55:20 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070707235520.4D78BA4612@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-07 16:55:19 -0700 (Sat, 07 Jul 2007)
New Revision: 19024

Log:
- adjust for the released 4.2.0 version


Modified:
   trunk/buildroot/toolchain/gcc/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2007-07-07 23:54:33 UTC (rev 19023)
+++ trunk/buildroot/toolchain/gcc/Config.in	2007-07-07 23:55:19 UTC (rev 19024)
@@ -143,7 +143,7 @@
 	bool "Build/install c++ compiler and libstdc++?"
 	default n
 	# huh? why so? select BR2_LARGEFILE
-	select BR2_LARGEFILE if !BR2_GCC_VERSION_4_2
+	select BR2_LARGEFILE if !BR2_GCC_VERSION_4_2_0 && !BR2_GCC_VERSION_4_3
 	help
 	  Build/install c++ compiler and libstdc++?
 
