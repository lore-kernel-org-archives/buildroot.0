From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 27 Apr 2009 14:07:42 +0000 (UTC)
Subject: [Buildroot] svn commit: [26220] trunk/buildroot/toolchain/gcc
Message-ID: <20090427140743.236C47745E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-27 14:07:42 +0000 (Mon, 27 Apr 2009)
New Revision: 26220

Log:
toolchain/gcc: java needs largefile support

Modified:
   trunk/buildroot/toolchain/gcc/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2009-04-27 14:07:36 UTC (rev 26219)
+++ trunk/buildroot/toolchain/gcc/Config.in	2009-04-27 14:07:42 UTC (rev 26220)
@@ -149,6 +149,7 @@
 	bool "Build/install java compiler and libgcj?"
 	depends on !BR2_avr32 && BR2_INSTALL_LIBSTDCPP
 	select BR2_GCC_CROSS_JAVA
+	select BR2_LARGEFILE
 	help
 	  Build/install java compiler and libgcj?
 
