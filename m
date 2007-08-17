From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 17 Aug 2007 16:06:26 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
Message-ID: <20070817230626.8D59FA4600@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-17 16:06:25 -0700 (Fri, 17 Aug 2007)
New Revision: 19551

Log:
Add binutils dependencies on AVR32

Modified:
   trunk/buildroot/toolchain/binutils/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/binutils/Config.in
===================================================================
--- trunk/buildroot/toolchain/binutils/Config.in	2007-08-17 19:21:12 UTC (rev 19550)
+++ trunk/buildroot/toolchain/binutils/Config.in	2007-08-17 23:06:25 UTC (rev 19551)
@@ -9,35 +9,35 @@
 	  Select the version of binutils you wish to use.
 
 	config BR2_BINUTILS_VERSION_2_14_90_0_8
-		depends !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.14.90.0.8"
 
 	config BR2_BINUTILS_VERSION_2_15
-		depends BR2_DEPRECATED
+		depends !BR2_avr32 &&  BR2_DEPRECATED
 		bool "binutils 2.15"
 
 	config BR2_BINUTILS_VERSION_2_15_94_0_2_2
-		depends !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.15.94.0.2.2"
 
 	config BR2_BINUTILS_VERSION_2_16_1
-		depends !BR2_nios2
+		depends !BR2_avr32 && !BR2_nios2
 		bool "binutils 2.16.1"
 
 	config BR2_BINUTILS_VERSION_2_16_90_0_3
-		depends !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.16.90.0.3"
 
 	config BR2_BINUTILS_VERSION_2_16_91_0_5
-		depends !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.16.91.0.5"
 
 	config BR2_BINUTILS_VERSION_2_16_91_0_6
-		depends !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.16.91.0.6"
 
 	config BR2_BINUTILS_VERSION_2_16_91_0_7
-		depends !BR2_nios2
+		depends !BR2_avr32 && !BR2_nios2
 		bool "binutils 2.16.91.0.7"
 
 	config BR2_BINUTILS_VERSION_2_17
@@ -45,55 +45,55 @@
 		bool "binutils 2.17"
 
 	config BR2_BINUTILS_VERSION_2_17_50_0_2
-		depends !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.17.50.0.2"
 
 	config BR2_BINUTILS_VERSION_2_17_50_0_3
-		depends !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.17.50.0.3"
 
 	config BR2_BINUTILS_VERSION_2_17_50_0_4
-		depends !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.17.50.0.4"
 
 	config BR2_BINUTILS_VERSION_2_17_50_0_5
-		depends !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.17.50.0.5"
 
 	config BR2_BINUTILS_VERSION_2_17_50_0_6
-		depends !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.17.50.0.6"
 
 	config BR2_BINUTILS_VERSION_2_17_50_0_7
-		depends !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.17.50.0.7"
 
 	config BR2_BINUTILS_VERSION_2_17_50_0_8
-		depends !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.17.50.0.8"
 
 	config BR2_BINUTILS_VERSION_2_17_50_0_9
-		depends !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.17.50.0.9"
 
 	config BR2_BINUTILS_VERSION_2_17_50_0_10
-		depends !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.17.50.0.10"
 
 	config BR2_BINUTILS_VERSION_2_17_50_0_12
-		depends !BR2_nios2
+		depends !BR2_avr32 && !BR2_nios2
 		bool "binutils 2.17.50.0.12"
 
 	config BR2_BINUTILS_VERSION_2_17_50_0_14
-		depends !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.17.50.0.14"
 
 	config BR2_BINUTILS_VERSION_2_17_50_0_16
-		depends !BR2_nios2 && BR2_DEPRECATED
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "binutils 2.17.50.0.16"
 
 	config BR2_BINUTILS_VERSION_2_17_50_0_17
-		depends !BR2_nios2
+		depends !BR2_avr32 && !BR2_nios2
 		bool "binutils 2.17.50.0.17"
 endchoice
 
