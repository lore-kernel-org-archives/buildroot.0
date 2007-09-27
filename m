From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 27 Sep 2007 15:04:29 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Arm
Message-ID: <20070927220429.4C803A603D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-27 15:04:28 -0700 (Thu, 27 Sep 2007)
New Revision: 20076

Log:
- toggle default back to soft-float


Modified:
   trunk/buildroot/target/device/Arm/integrator926_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Arm/integrator926_defconfig
===================================================================
--- trunk/buildroot/target/device/Arm/integrator926_defconfig	2007-09-27 21:58:46 UTC (rev 20075)
+++ trunk/buildroot/target/device/Arm/integrator926_defconfig	2007-09-27 22:04:28 UTC (rev 20076)
@@ -240,7 +240,7 @@
 # BR2_INET_IPV6 is not set
 # BR2_INET_RPC is not set
 # BR2_USE_WCHAR is not set
-# BR2_SOFT_FLOAT is not set
+BR2_SOFT_FLOAT=y
 BR2_TARGET_OPTIMIZATION="-Os -pipe -fwrapv"
 BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
 
