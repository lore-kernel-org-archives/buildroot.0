From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 14 Mar 2007 06:54:31 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20070314135431.4EC3F48611@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-14 06:54:30 -0700 (Wed, 14 Mar 2007)
New Revision: 18102

Log:
- bump version


Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2007-03-14 13:02:07 UTC (rev 18101)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2007-03-14 13:54:30 UTC (rev 18102)
@@ -60,4 +60,4 @@
 	default "2.6.11"    if BR2_KERNEL_HEADERS_2_6_11
 	default "2.6.12"    if BR2_KERNEL_HEADERS_2_6_12
 	default "2.6.19.2"  if BR2_KERNEL_HEADERS_2_6_19_2
-	default "2.6.20"    if BR2_KERNEL_HEADERS_2_6_20
+	default "2.6.20.3"  if BR2_KERNEL_HEADERS_2_6_20

Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2007-03-14 13:02:07 UTC (rev 18101)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2007-03-14 13:54:30 UTC (rev 18102)
@@ -4,11 +4,11 @@
 #
 #############################################################
 
-ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.20")
+ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.20.3")
 VERSION:=2
 PATCHLEVEL:=6
 SUBLEVEL:=20
-EXTRAVERSION:=
+EXTRAVERSION:=.3
 LOCALVERSION:=
 LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
 LINUX_HEADERS_SITE:=http://www.kernel.org/pub/linux/kernel/v2.6/
