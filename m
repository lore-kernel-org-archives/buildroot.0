From: vapier at uclibc.org <vapier@uclibc.org>
Date: Sat,  2 Dec 2006 11:02:21 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
Message-ID: <20061202190221.AC85B4860D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vapier
Date: 2006-12-02 11:02:21 -0800 (Sat, 02 Dec 2006)
New Revision: 16764

Log:
ver bump

Added:
   trunk/buildroot/toolchain/binutils/2.17.50.0.8/

Modified:
   trunk/buildroot/toolchain/binutils/Config.in


Changeset:
Copied: trunk/buildroot/toolchain/binutils/2.17.50.0.8 (from rev 16762, trunk/buildroot/toolchain/binutils/2.17.50.0.7)

Modified: trunk/buildroot/toolchain/binutils/Config.in
===================================================================
--- trunk/buildroot/toolchain/binutils/Config.in	2006-12-02 19:01:10 UTC (rev 16763)
+++ trunk/buildroot/toolchain/binutils/Config.in	2006-12-02 19:02:21 UTC (rev 16764)
@@ -67,6 +67,10 @@
 		depends !BR2_nios2
 		bool "binutils 2.17.50.0.7"
 
+	config BR2_BINUTILS_VERSION_2_17_50_0_8
+		depends !BR2_nios2
+		bool "binutils 2.17.50.0.8"
+
 endchoice
 
 config BR2_BINUTILS_VERSION
@@ -86,6 +90,7 @@
 	default "2.17.50.0.5"     if BR2_BINUTILS_VERSION_2_17_50_0_5
 	default "2.17.50.0.6"     if BR2_BINUTILS_VERSION_2_17_50_0_6
 	default "2.17.50.0.7"     if BR2_BINUTILS_VERSION_2_17_50_0_7
+	default "2.17.50.0.8"     if BR2_BINUTILS_VERSION_2_17_50_0_8
 
 config BR2_EXTRA_BINUTILS_CONFIG_OPTIONS
 	string "Additional binutils options"
