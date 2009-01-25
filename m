From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 25 Jan 2009 21:53:15 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel:
	at91rm9200df at91sam9g20dfc atngw100-bas etc...
Message-ID: <20090125215315.8FF4B76D28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-25 21:53:14 +0000 (Sun, 25 Jan 2009)
New Revision: 25025

Log:
Revert Atmel boards back to desired operation

Modified:
   trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig
   trunk/buildroot/target/device/Atmel/atngw100-base/atngw100-base_defconfig
   trunk/buildroot/target/device/Atmel/atstk1005/atstk1005_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig	2009-01-25 21:48:33 UTC (rev 25024)
+++ trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig	2009-01-25 21:53:14 UTC (rev 25025)
@@ -996,9 +996,9 @@
 BR2_PACKAGE_LINUX_USE_KCONFIG=y
 # BR2_PACKAGE_LINUX_USE_DEFCONFIG is not set
 # BR2_PACKAGE_LINUX_USE_XCONFIG is not set
-# BR2_MAKE_XCONFIG is not set
-BR2_MAKE_MENUCONFIG=y
-BR2_KERNEL_CONFIG_METHOD="menuconfig"
+BR2_MAKE_XCONFIG=y
+# BR2_MAKE_MENUCONFIG is not set
+BR2_KERNEL_CONFIG_METHOD="xconfig"
 # BR2_LINUX_BIN_BZIMAGE is not set
 BR2_LINUX_BIN_UIMAGE=y
 # BR2_LINUX_BIN_VMLINUX is not set

Modified: trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig	2009-01-25 21:48:33 UTC (rev 25024)
+++ trunk/buildroot/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig	2009-01-25 21:53:14 UTC (rev 25025)
@@ -882,9 +882,9 @@
 BR2_PACKAGE_LINUX_USE_KCONFIG=y
 # BR2_PACKAGE_LINUX_USE_DEFCONFIG is not set
 # BR2_PACKAGE_LINUX_USE_XCONFIG is not set
-# BR2_MAKE_XCONFIG is not set
-BR2_MAKE_MENUCONFIG=y
-BR2_KERNEL_CONFIG_METHOD="menuconfig"
+BR2_MAKE_XCONFIG=y
+# BR2_MAKE_MENUCONFIG is not set
+BR2_KERNEL_CONFIG_METHOD="xconfig"
 # BR2_LINUX_BIN_BZIMAGE is not set
 BR2_LINUX_BIN_UIMAGE=y
 # BR2_LINUX_BIN_VMLINUX is not set

Modified: trunk/buildroot/target/device/Atmel/atngw100-base/atngw100-base_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100-base/atngw100-base_defconfig	2009-01-25 21:48:33 UTC (rev 25024)
+++ trunk/buildroot/target/device/Atmel/atngw100-base/atngw100-base_defconfig	2009-01-25 21:53:14 UTC (rev 25025)
@@ -587,9 +587,9 @@
 BR2_PACKAGE_LINUX_USE_KCONFIG=y
 # BR2_PACKAGE_LINUX_USE_DEFCONFIG is not set
 # BR2_PACKAGE_LINUX_USE_XCONFIG is not set
-# BR2_MAKE_XCONFIG is not set
-BR2_MAKE_MENUCONFIG=y
-BR2_KERNEL_CONFIG_METHOD="menuconfig"
+BR2_MAKE_XCONFIG=y
+# BR2_MAKE_MENUCONFIG is not set
+BR2_KERNEL_CONFIG_METHOD="xconfig"
 # BR2_LINUX_BIN_BZIMAGE is not set
 BR2_LINUX_BIN_UIMAGE=y
 # BR2_LINUX_BIN_VMLINUX is not set

Modified: trunk/buildroot/target/device/Atmel/atstk1005/atstk1005_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1005/atstk1005_defconfig	2009-01-25 21:48:33 UTC (rev 25024)
+++ trunk/buildroot/target/device/Atmel/atstk1005/atstk1005_defconfig	2009-01-25 21:53:14 UTC (rev 25025)
@@ -857,9 +857,9 @@
 BR2_PACKAGE_LINUX_USE_KCONFIG=y
 # BR2_PACKAGE_LINUX_USE_DEFCONFIG is not set
 # BR2_PACKAGE_LINUX_USE_XCONFIG is not set
-# BR2_MAKE_XCONFIG is not set
-BR2_MAKE_MENUCONFIG=y
-BR2_KERNEL_CONFIG_METHOD="menuconfig"
+BR2_MAKE_XCONFIG=y
+# BR2_MAKE_MENUCONFIG is not set
+BR2_KERNEL_CONFIG_METHOD="xconfig"
 # BR2_LINUX_BIN_BZIMAGE is not set
 BR2_LINUX_BIN_UIMAGE=y
 # BR2_LINUX_BIN_VMLINUX is not set
