From: vapier at uclibc.org <vapier@uclibc.org>
Date: Wed, 27 Sep 2006 15:48:57 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
Message-ID: <20060927224857.6E962485F7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vapier
Date: 2006-09-27 15:48:57 -0700 (Wed, 27 Sep 2006)
New Revision: 16241

Log:
2.17.50.0.5 ver bump

Added:
   trunk/buildroot/toolchain/binutils/2.17.50.0.5/

Modified:
   trunk/buildroot/toolchain/binutils/Config.in


Changeset:
Copied: trunk/buildroot/toolchain/binutils/2.17.50.0.5 (from rev 16240, trunk/buildroot/toolchain/binutils/2.17.50.0.4)

Modified: trunk/buildroot/toolchain/binutils/Config.in
===================================================================
--- trunk/buildroot/toolchain/binutils/Config.in	2006-09-27 22:44:48 UTC (rev 16240)
+++ trunk/buildroot/toolchain/binutils/Config.in	2006-09-27 22:48:57 UTC (rev 16241)
@@ -55,6 +55,10 @@
 		depends !BR2_nios2
 		bool "binutils 2.17.50.0.4"
 
+	config BR2_BINUTILS_VERSION_2_17_50_0_5
+		depends !BR2_nios2
+		bool "binutils 2.17.50.0.5"
+
 endchoice
 
 config BR2_BINUTILS_VERSION
@@ -71,6 +75,7 @@
 	default "2.17.50.0.2"     if BR2_BINUTILS_VERSION_2_17_50_0_2
 	default "2.17.50.0.3"     if BR2_BINUTILS_VERSION_2_17_50_0_3
 	default "2.17.50.0.4"     if BR2_BINUTILS_VERSION_2_17_50_0_4
+	default "2.17.50.0.5"     if BR2_BINUTILS_VERSION_2_17_50_0_5
 
 config BR2_EXTRA_BINUTILS_CONFIG_OPTIONS
 	string "Additional binutils options"
