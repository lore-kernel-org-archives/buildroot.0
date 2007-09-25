From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 25 Sep 2007 04:51:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070925115115.1E55D3006B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-25 04:51:15 -0700 (Tue, 25 Sep 2007)
New Revision: 20008

Log:
- adjust defconfig


Modified:
   trunk/buildroot/.defconfig


Changeset:
Modified: trunk/buildroot/.defconfig
===================================================================
--- trunk/buildroot/.defconfig	2007-09-25 11:38:20 UTC (rev 20007)
+++ trunk/buildroot/.defconfig	2007-09-25 11:51:15 UTC (rev 20008)
@@ -25,14 +25,12 @@
 # BR2_KERNEL_HEADERS_2_6_9 is not set
 # BR2_KERNEL_HEADERS_2_6_11 is not set
 # BR2_KERNEL_HEADERS_2_6_12 is not set
-# BR2_KERNEL_HEADERS_2_6_19_2 is not set
-BR2_KERNEL_HEADERS_2_6_20=y
-BR2_DEFAULT_KERNEL_HEADERS="2.6.20.4"
+BR2_KERNEL_HEADERS_2_6_22=y
+BR2_DEFAULT_KERNEL_HEADERS="2.6.22.8"
 
 #
 # uClibc Options
 #
-# BR2_UCLIBC_VERSION_0_9_28 is not set
 # BR2_UCLIBC_VERSION_0_9_28_3 is not set
 BR2_UCLIBC_VERSION_0_9_29=y
 # BR2_UCLIBC_VERSION_SNAPSHOT is not set
@@ -48,52 +46,22 @@
 #
 # Binutils Options
 #
-# BR2_BINUTILS_VERSION_2_14_90_0_8 is not set
-# BR2_BINUTILS_VERSION_2_15 is not set
-# BR2_BINUTILS_VERSION_2_15_94_0_2_2 is not set
-# BR2_BINUTILS_VERSION_2_16_1 is not set
-# BR2_BINUTILS_VERSION_2_16_90_0_3 is not set
-# BR2_BINUTILS_VERSION_2_16_91_0_5 is not set
-# BR2_BINUTILS_VERSION_2_16_91_0_6 is not set
-# BR2_BINUTILS_VERSION_2_16_91_0_7 is not set
-BR2_BINUTILS_VERSION_2_17=y
-# BR2_BINUTILS_VERSION_2_17_50_0_2 is not set
-# BR2_BINUTILS_VERSION_2_17_50_0_3 is not set
-# BR2_BINUTILS_VERSION_2_17_50_0_4 is not set
-# BR2_BINUTILS_VERSION_2_17_50_0_5 is not set
-# BR2_BINUTILS_VERSION_2_17_50_0_6 is not set
-# BR2_BINUTILS_VERSION_2_17_50_0_7 is not set
-# BR2_BINUTILS_VERSION_2_17_50_0_8 is not set
-# BR2_BINUTILS_VERSION_2_17_50_0_9 is not set
-# BR2_BINUTILS_VERSION_2_17_50_0_10 is not set
-# BR2_BINUTILS_VERSION_2_17_50_0_12 is not set
-# BR2_BINUTILS_VERSION_2_17_50_0_14 is not set
-# BR2_BINUTILS_VERSION_2_17_50_0_16 is not set
-BR2_BINUTILS_VERSION="2.17"
+BR2_BINUTILS_VERSION_2_18=y
+# BR2_BINUTILS_VERSION_2_18_50_0_1 is not set
+BR2_BINUTILS_VERSION="2.18"
 BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
 
 
 #
 # Gcc Options
 #
-# BR2_GCC_VERSION_3_3_5 is not set
-# BR2_GCC_VERSION_3_3_6 is not set
-# BR2_GCC_VERSION_3_4_2 is not set
-# BR2_GCC_VERSION_3_4_3 is not set
-# BR2_GCC_VERSION_3_4_4 is not set
-# BR2_GCC_VERSION_3_4_5 is not set
 # BR2_GCC_VERSION_3_4_6 is not set
-# BR2_GCC_VERSION_4_0_0 is not set
-# BR2_GCC_VERSION_4_0_1 is not set
-# BR2_GCC_VERSION_4_0_2 is not set
-# BR2_GCC_VERSION_4_0_3 is not set
 # BR2_GCC_VERSION_4_0_4 is not set
-# BR2_GCC_VERSION_4_1_0 is not set
-# BR2_GCC_VERSION_4_1_1 is not set
 # BR2_GCC_VERSION_4_1_2 is not set
-BR2_GCC_VERSION_4_2_0=y
+# BR2_GCC_VERSION_4_2_0 is not set
+BR2_GCC_VERSION_4_2_1=y
 # BR2_GCC_IS_SNAP is not set
-BR2_GCC_VERSION="4.2.0"
+BR2_GCC_VERSION="4.2.1"
 # BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
 BR2_GCC_SHARED_LIBGCC=y
