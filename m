From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  2 Jun 2008 05:25:26 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20080602122526.82B273C8CF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-02 05:25:24 -0700 (Mon, 02 Jun 2008)
New Revision: 22181

Log:
kernel headers: add BR2_DEPRECATED / BR2_RECENT annotations to 2.6.2x


Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2008-06-02 12:25:20 UTC (rev 22180)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2008-06-02 12:25:24 UTC (rev 22181)
@@ -53,28 +53,31 @@
 		bool "Linux 2.6.20.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_21_5
-		depends !BR2_avr32 && !BR2_nios2
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "Linux 2.6.21.5 kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_21
-		depends !BR2_avr32 && !BR2_nios2
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "Linux 2.6.21.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_22_1
-		depends !BR2_avr32 && !BR2_nios2
+		depends !BR2_avr32 && !BR2_nios2 && BR2_DEPRECATED
 		bool "Linux 2.6.22.1 kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_22_10
-		depends !BR2_nios2
+		depends !BR2_nios2 && BR2_DEPRECATED
 		bool "Linux 2.6.22.10 kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_22
+		depends BR2_DEPRECATED
 		bool "Linux 2.6.22.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_23
+		depends BR2_DEPRECATED
 		bool "Linux 2.6.23.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_24
+		depends BR2_RECENT
 		bool "Linux 2.6.24.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_25
