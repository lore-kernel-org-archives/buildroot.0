From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 16 Jan 2007 05:24:49 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
Message-ID: <20070116132449.2123148591@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-16 05:24:47 -0800 (Tue, 16 Jan 2007)
New Revision: 17325

Log:
- bump version


Added:
   trunk/buildroot/toolchain/binutils/2.17.50.0.9/

Modified:
   trunk/buildroot/toolchain/binutils/Config.in


Changeset:
Copied: trunk/buildroot/toolchain/binutils/2.17.50.0.9 (from rev 17324, trunk/buildroot/toolchain/binutils/2.17.50.0.8)

Modified: trunk/buildroot/toolchain/binutils/Config.in
===================================================================
--- trunk/buildroot/toolchain/binutils/Config.in	2007-01-16 09:35:11 UTC (rev 17324)
+++ trunk/buildroot/toolchain/binutils/Config.in	2007-01-16 13:24:47 UTC (rev 17325)
@@ -71,6 +71,10 @@
 		depends !BR2_nios2
 		bool "binutils 2.17.50.0.8"
 
+	config BR2_BINUTILS_VERSION_2_17_50_0_9
+		depends !BR2_nios2
+		bool "binutils 2.17.50.0.9"
+
 endchoice
 
 config BR2_BINUTILS_VERSION
@@ -91,6 +95,7 @@
 	default "2.17.50.0.6"     if BR2_BINUTILS_VERSION_2_17_50_0_6
 	default "2.17.50.0.7"     if BR2_BINUTILS_VERSION_2_17_50_0_7
 	default "2.17.50.0.8"     if BR2_BINUTILS_VERSION_2_17_50_0_8
+	default "2.17.50.0.9"     if BR2_BINUTILS_VERSION_2_17_50_0_9
 
 config BR2_EXTRA_BINUTILS_CONFIG_OPTIONS
 	string "Additional binutils options"
