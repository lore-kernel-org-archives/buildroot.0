From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 20 Mar 2008 15:31:50 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/ARMLTD
Message-ID: <20080320223150.D4BAF3C316@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-03-20 15:31:50 -0700 (Thu, 20 Mar 2008)
New Revision: 21421

Log:
Ensure at least one ARM board is selected, if ARMLTD selected

Modified:
   trunk/buildroot/target/device/ARMLTD/Config.in


Changeset:
Modified: trunk/buildroot/target/device/ARMLTD/Config.in
===================================================================
--- trunk/buildroot/target/device/ARMLTD/Config.in	2008-03-20 22:07:49 UTC (rev 21420)
+++ trunk/buildroot/target/device/ARMLTD/Config.in	2008-03-20 22:31:50 UTC (rev 21421)
@@ -9,7 +9,7 @@
 config BR2_TARGET_ARM_INTEGRATOR_926
 	bool "Integrator arm926"
 	depends BR2_arm && BR2_TARGET_ARMLTD
-	default n
+	default y
 	select BR2_PACKAGE_LINUX
 	select BR2_ARM_EABI
 	select BR2_KERNEL_HEADERS_2_6_22
