From: vapier at uclibc.org <vapier@uclibc.org>
Date: Fri, 20 Oct 2006 22:34:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
Message-ID: <20061021053400.3D4F148984@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vapier
Date: 2006-10-20 22:33:59 -0700 (Fri, 20 Oct 2006)
New Revision: 16418

Log:
2.17.50.0.6 ver bump

Added:
   trunk/buildroot/toolchain/binutils/2.17.50.0.6/

Modified:
   trunk/buildroot/toolchain/binutils/Config.in


Changeset:
Copied: trunk/buildroot/toolchain/binutils/2.17.50.0.6 (from rev 16417, trunk/buildroot/toolchain/binutils/2.17.50.0.5)

Modified: trunk/buildroot/toolchain/binutils/Config.in
===================================================================
--- trunk/buildroot/toolchain/binutils/Config.in	2006-10-20 23:48:30 UTC (rev 16417)
+++ trunk/buildroot/toolchain/binutils/Config.in	2006-10-21 05:33:59 UTC (rev 16418)
@@ -59,6 +59,10 @@
 		depends !BR2_nios2
 		bool "binutils 2.17.50.0.5"
 
+	config BR2_BINUTILS_VERSION_2_17_50_0_6
+		depends !BR2_nios2
+		bool "binutils 2.17.50.0.6"
+
 endchoice
 
 config BR2_BINUTILS_VERSION
@@ -76,6 +80,7 @@
 	default "2.17.50.0.3"     if BR2_BINUTILS_VERSION_2_17_50_0_3
 	default "2.17.50.0.4"     if BR2_BINUTILS_VERSION_2_17_50_0_4
 	default "2.17.50.0.5"     if BR2_BINUTILS_VERSION_2_17_50_0_5
+	default "2.17.50.0.6"     if BR2_BINUTILS_VERSION_2_17_50_0_6
 
 config BR2_EXTRA_BINUTILS_CONFIG_OPTIONS
 	string "Additional binutils options"
