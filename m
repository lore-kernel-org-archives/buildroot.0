From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Dec 2009 23:46:00 +0100
Subject: [Buildroot] [git commit master] remove BR2_KERNEL_HURD from
	defconfig files
Message-ID: <20091214231106.4EDEF777E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a2fd9751155657999b75367dea5b081dad1254b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/arm_toolchain_defconfig           |    1 -
 configs/at91rm9200df_defconfig            |    1 -
 configs/at91rm9200df_ext_bare_defconfig   |    1 -
 configs/at91rm9200df_ext_defconfig        |    1 -
 configs/at91sam9260dfc_defconfig          |    1 -
 configs/at91sam9260dfc_ext_bare_defconfig |    1 -
 configs/at91sam9260dfc_ext_defconfig      |    1 -
 configs/at91sam9261ek_defconfig           |    1 -
 configs/at91sam9261ek_ext_bare_defconfig  |    1 -
 configs/at91sam9261ek_ext_defconfig       |    1 -
 configs/at91sam9263ek_defconfig           |    1 -
 configs/at91sam9263ek_ext_bare_defconfig  |    1 -
 configs/at91sam9263ek_ext_defconfig       |    1 -
 configs/at91sam9g20dfc_defconfig          |    1 -
 configs/at91sam9g20dfc_ext_bare_defconfig |    1 -
 configs/at91sam9g20dfc_ext_defconfig      |    1 -
 configs/atngw100-base_defconfig           |    1 -
 configs/atngw100_defconfig                |    1 -
 configs/atstk1005_defconfig               |    1 -
 configs/atstk100x_defconfig               |    1 -
 configs/i386_defconfig                    |    1 -
 configs/i686_defconfig                    |    1 -
 configs/integrator926_defconfig           |    1 -
 configs/integrator926_huge_defconfig      |    1 -
 configs/kb9202_defconfig                  |    1 -
 configs/v100sc2_defconfig                 |    1 -
 scripts/test/Config.in.test.buildall      |    1 -
 27 files changed, 0 insertions(+), 27 deletions(-)

diff --git a/configs/arm_toolchain_defconfig b/configs/arm_toolchain_defconfig
index 6c903d0..9e4c6c9 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -757,4 +757,3 @@ BR2_BOOTSOURCE=y
 BR2_KERNEL_none=y
 # BR2_KERNEL_LINUX_ADVANCED is not set
 # BR2_KERNEL_LINUX is not set
-# BR2_KERNEL_HURD is not set
diff --git a/configs/at91rm9200df_defconfig b/configs/at91rm9200df_defconfig
index aba4d0d..77cf724 100644
--- a/configs/at91rm9200df_defconfig
+++ b/configs/at91rm9200df_defconfig
@@ -962,7 +962,6 @@ BR2_BOOTSOURCE=y
 # BR2_KERNEL_none is not set
 BR2_KERNEL_LINUX_ADVANCED=y
 # BR2_KERNEL_LINUX is not set
-# BR2_KERNEL_HURD is not set
 BR2_PACKAGE_LINUX=y
 BR2_PACKAGE_LINUX_KCONFIG="$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-$(BR2_LINUX26_VERSION).config"
 BR2_PACKAGE_LINUX_FORMAT="uImage"
diff --git a/configs/at91rm9200df_ext_bare_defconfig b/configs/at91rm9200df_ext_bare_defconfig
index 463f556..e7da7a8 100644
--- a/configs/at91rm9200df_ext_bare_defconfig
+++ b/configs/at91rm9200df_ext_bare_defconfig
@@ -676,4 +676,3 @@ BR2_BOOTSOURCE=y
 BR2_KERNEL_none=y
 # BR2_KERNEL_LINUX_ADVANCED is not set
 # BR2_KERNEL_LINUX is not set
-# BR2_KERNEL_HURD is not set
diff --git a/configs/at91rm9200df_ext_defconfig b/configs/at91rm9200df_ext_defconfig
index 4c8d50d..d4fa122 100644
--- a/configs/at91rm9200df_ext_defconfig
+++ b/configs/at91rm9200df_ext_defconfig
@@ -887,7 +887,6 @@ BR2_BOOTSOURCE=y
 # BR2_KERNEL_none is not set
 BR2_KERNEL_LINUX_ADVANCED=y
 # BR2_KERNEL_LINUX is not set
-# BR2_KERNEL_HURD is not set
 BR2_PACKAGE_LINUX=y
 BR2_PACKAGE_LINUX_KCONFIG="$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-$(BR2_LINUX26_VERSION).config"
 BR2_PACKAGE_LINUX_FORMAT="uImage"
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index 056a661..d7f6e7a 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -977,7 +977,6 @@ BR2_BOOTSOURCE=y
 # BR2_KERNEL_none is not set
 BR2_KERNEL_LINUX_ADVANCED=y
 # BR2_KERNEL_LINUX is not set
-# BR2_KERNEL_HURD is not set
 BR2_PACKAGE_LINUX=y
 BR2_PACKAGE_LINUX_KCONFIG="$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-$(BR2_LINUX26_VERSION).config"
 BR2_PACKAGE_LINUX_FORMAT="uImage"
diff --git a/configs/at91sam9260dfc_ext_bare_defconfig b/configs/at91sam9260dfc_ext_bare_defconfig
index 1048d9c..1d272e4 100644
--- a/configs/at91sam9260dfc_ext_bare_defconfig
+++ b/configs/at91sam9260dfc_ext_bare_defconfig
@@ -677,4 +677,3 @@ BR2_BOOTSOURCE=y
 BR2_KERNEL_none=y
 # BR2_KERNEL_LINUX_ADVANCED is not set
 # BR2_KERNEL_LINUX is not set
-# BR2_KERNEL_HURD is not set
diff --git a/configs/at91sam9260dfc_ext_defconfig b/configs/at91sam9260dfc_ext_defconfig
index 3436849..5fd78d1 100644
--- a/configs/at91sam9260dfc_ext_defconfig
+++ b/configs/at91sam9260dfc_ext_defconfig
@@ -896,7 +896,6 @@ BR2_BOOTSOURCE=y
 # BR2_KERNEL_none is not set
 BR2_KERNEL_LINUX_ADVANCED=y
 # BR2_KERNEL_LINUX is not set
-# BR2_KERNEL_HURD is not set
 BR2_PACKAGE_LINUX=y
 BR2_PACKAGE_LINUX_KCONFIG="$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-$(BR2_LINUX26_VERSION).config"
 BR2_PACKAGE_LINUX_FORMAT="uImage"
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index 2af89ac..bf88ff1 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -1029,7 +1029,6 @@ BR2_BOOTSOURCE=y
 # BR2_KERNEL_none is not set
 BR2_KERNEL_LINUX_ADVANCED=y
 # BR2_KERNEL_LINUX is not set
-# BR2_KERNEL_HURD is not set
 BR2_PACKAGE_LINUX=y
 BR2_PACKAGE_LINUX_FORMAT="uImage"
 BR2_KERNEL_CURRENT_VERSION="2.6.28.2"
diff --git a/configs/at91sam9261ek_ext_bare_defconfig b/configs/at91sam9261ek_ext_bare_defconfig
index 7c11189..22db484 100644
--- a/configs/at91sam9261ek_ext_bare_defconfig
+++ b/configs/at91sam9261ek_ext_bare_defconfig
@@ -680,4 +680,3 @@ BR2_BOOTSOURCE=y
 BR2_KERNEL_none=y
 # BR2_KERNEL_LINUX_ADVANCED is not set
 # BR2_KERNEL_LINUX is not set
-# BR2_KERNEL_HURD is not set
diff --git a/configs/at91sam9261ek_ext_defconfig b/configs/at91sam9261ek_ext_defconfig
index e233b94..87c1904 100644
--- a/configs/at91sam9261ek_ext_defconfig
+++ b/configs/at91sam9261ek_ext_defconfig
@@ -985,7 +985,6 @@ BR2_BOOTSOURCE=y
 # BR2_KERNEL_none is not set
 BR2_KERNEL_LINUX_ADVANCED=y
 # BR2_KERNEL_LINUX is not set
-# BR2_KERNEL_HURD is not set
 BR2_PACKAGE_LINUX=y
 BR2_PACKAGE_LINUX_FORMAT="uImage"
 BR2_KERNEL_CURRENT_VERSION="2.6.28.2"
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index d7645d9..7ed5e94 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -1026,7 +1026,6 @@ BR2_BOOTSOURCE=y
 # BR2_KERNEL_none is not set
 BR2_KERNEL_LINUX_ADVANCED=y
 # BR2_KERNEL_LINUX is not set
-# BR2_KERNEL_HURD is not set
 BR2_PACKAGE_LINUX=y
 BR2_PACKAGE_LINUX_FORMAT="uImage"
 BR2_KERNEL_CURRENT_VERSION="2.6.28.2"
diff --git a/configs/at91sam9263ek_ext_bare_defconfig b/configs/at91sam9263ek_ext_bare_defconfig
index d31b8de..27b2791 100644
--- a/configs/at91sam9263ek_ext_bare_defconfig
+++ b/configs/at91sam9263ek_ext_bare_defconfig
@@ -679,4 +679,3 @@ BR2_BOOTSOURCE=y
 BR2_KERNEL_none=y
 # BR2_KERNEL_LINUX_ADVANCED is not set
 # BR2_KERNEL_LINUX is not set
-# BR2_KERNEL_HURD is not set
diff --git a/configs/at91sam9263ek_ext_defconfig b/configs/at91sam9263ek_ext_defconfig
index bda2149..f12f56d 100644
--- a/configs/at91sam9263ek_ext_defconfig
+++ b/configs/at91sam9263ek_ext_defconfig
@@ -947,7 +947,6 @@ BR2_BOOTSOURCE=y
 # BR2_KERNEL_none is not set
 BR2_KERNEL_LINUX_ADVANCED=y
 # BR2_KERNEL_LINUX is not set
-# BR2_KERNEL_HURD is not set
 BR2_PACKAGE_LINUX=y
 BR2_PACKAGE_LINUX_FORMAT="uImage"
 BR2_KERNEL_CURRENT_VERSION="2.6.28.2"
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index ed271d8..83dffe9 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -892,7 +892,6 @@ BR2_BOOTSOURCE=y
 # BR2_KERNEL_none is not set
 BR2_KERNEL_LINUX_ADVANCED=y
 # BR2_KERNEL_LINUX is not set
-# BR2_KERNEL_HURD is not set
 BR2_PACKAGE_LINUX=y
 BR2_PACKAGE_LINUX_KCONFIG="$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-$(BR2_LINUX26_VERSION).config"
 BR2_PACKAGE_LINUX_FORMAT="uImage"
diff --git a/configs/at91sam9g20dfc_ext_bare_defconfig b/configs/at91sam9g20dfc_ext_bare_defconfig
index 0b778eb..a4af5c1 100644
--- a/configs/at91sam9g20dfc_ext_bare_defconfig
+++ b/configs/at91sam9g20dfc_ext_bare_defconfig
@@ -676,4 +676,3 @@ BR2_BOOTSOURCE=y
 BR2_KERNEL_none=y
 # BR2_KERNEL_LINUX_ADVANCED is not set
 # BR2_KERNEL_LINUX is not set
-# BR2_KERNEL_HURD is not set
diff --git a/configs/at91sam9g20dfc_ext_defconfig b/configs/at91sam9g20dfc_ext_defconfig
index 5f5dbe2..5229529 100644
--- a/configs/at91sam9g20dfc_ext_defconfig
+++ b/configs/at91sam9g20dfc_ext_defconfig
@@ -895,7 +895,6 @@ BR2_BOOTSOURCE=y
 # BR2_KERNEL_none is not set
 BR2_KERNEL_LINUX_ADVANCED=y
 # BR2_KERNEL_LINUX is not set
-# BR2_KERNEL_HURD is not set
 BR2_PACKAGE_LINUX=y
 BR2_PACKAGE_LINUX_KCONFIG="$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-$(BR2_LINUX26_VERSION).config"
 BR2_PACKAGE_LINUX_FORMAT="uImage"
diff --git a/configs/atngw100-base_defconfig b/configs/atngw100-base_defconfig
index b6337ff..f965630 100644
--- a/configs/atngw100-base_defconfig
+++ b/configs/atngw100-base_defconfig
@@ -787,7 +787,6 @@ BR2_TARGET_UBOOT_CUSTOM_PATCH=""
 # BR2_KERNEL_none is not set
 BR2_KERNEL_LINUX_ADVANCED=y
 # BR2_KERNEL_LINUX is not set
-# BR2_KERNEL_HURD is not set
 BR2_PACKAGE_LINUX=y
 BR2_PACKAGE_LINUX_KCONFIG="$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-2.6.22.5.config"
 BR2_PACKAGE_LINUX_FORMAT="uImage"
diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index 5f05009..53c5667 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -800,7 +800,6 @@ BR2_TARGET_UBOOT_ETH1ADDR=""
 # BR2_KERNEL_none is not set
 BR2_KERNEL_LINUX_ADVANCED=y
 # BR2_KERNEL_LINUX is not set
-# BR2_KERNEL_HURD is not set
 BR2_PACKAGE_LINUX=y
 BR2_PACKAGE_LINUX_KCONFIG="$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-2.6.29.2.config"
 BR2_PACKAGE_LINUX_FORMAT="uImage"
diff --git a/configs/atstk1005_defconfig b/configs/atstk1005_defconfig
index 5241859..ce25519 100644
--- a/configs/atstk1005_defconfig
+++ b/configs/atstk1005_defconfig
@@ -817,7 +817,6 @@ BR2_TARGET_UBOOT_CUSTOM_PATCH=""
 # BR2_KERNEL_none is not set
 BR2_KERNEL_LINUX_ADVANCED=y
 # BR2_KERNEL_LINUX is not set
-# BR2_KERNEL_HURD is not set
 BR2_PACKAGE_LINUX=y
 BR2_PACKAGE_LINUX_KCONFIG="$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-$(BR2_LINUX_VERSION).config"
 BR2_PACKAGE_LINUX_FORMAT="uImage"
diff --git a/configs/atstk100x_defconfig b/configs/atstk100x_defconfig
index c8fb4e4..df09d2f 100644
--- a/configs/atstk100x_defconfig
+++ b/configs/atstk100x_defconfig
@@ -917,7 +917,6 @@ BR2_TARGET_UBOOT_CUSTOM_PATCH=""
 # BR2_KERNEL_none is not set
 BR2_KERNEL_LINUX_ADVANCED=y
 # BR2_KERNEL_LINUX is not set
-# BR2_KERNEL_HURD is not set
 BR2_PACKAGE_LINUX=y
 BR2_PACKAGE_LINUX_KCONFIG="$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-$(BR2_LINUX26_VERSION).config"
 BR2_PACKAGE_LINUX_FORMAT="uImage"
diff --git a/configs/i386_defconfig b/configs/i386_defconfig
index 0dec12e..dcc2cd3 100644
--- a/configs/i386_defconfig
+++ b/configs/i386_defconfig
@@ -738,7 +738,6 @@ BR2_TARGET_ROOTFS_JFFS2_COPYTO=""
 # BR2_KERNEL_none is not set
 BR2_KERNEL_LINUX_ADVANCED=y
 # BR2_KERNEL_LINUX is not set
-# BR2_KERNEL_HURD is not set
 BR2_PACKAGE_LINUX=y
 BR2_PACKAGE_LINUX_KCONFIG="target/device/x86/i386/linux-$(BR2_LINUX26_VERSION).config"
 BR2_PACKAGE_LINUX_FORMAT="bzImage"
diff --git a/configs/i686_defconfig b/configs/i686_defconfig
index 90dce72..0635883 100644
--- a/configs/i686_defconfig
+++ b/configs/i686_defconfig
@@ -738,7 +738,6 @@ BR2_TARGET_ROOTFS_JFFS2_COPYTO=""
 # BR2_KERNEL_none is not set
 BR2_KERNEL_LINUX_ADVANCED=y
 # BR2_KERNEL_LINUX is not set
-# BR2_KERNEL_HURD is not set
 BR2_PACKAGE_LINUX=y
 BR2_PACKAGE_LINUX_KCONFIG="$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-$(BR2_LINUX26_VERSION).config"
 BR2_PACKAGE_LINUX_FORMAT="bzImage"
diff --git a/configs/integrator926_defconfig b/configs/integrator926_defconfig
index 68b0ff6..8f0e4ed 100644
--- a/configs/integrator926_defconfig
+++ b/configs/integrator926_defconfig
@@ -743,7 +743,6 @@ BR2_TARGET_UBOOT_CUSTOM_PATCH=""
 # BR2_KERNEL_none is not set
 BR2_KERNEL_LINUX_ADVANCED=y
 # BR2_KERNEL_LINUX is not set
-# BR2_KERNEL_HURD is not set
 BR2_PACKAGE_LINUX=y
 BR2_PACKAGE_LINUX_KCONFIG="target/device/ARMLTD/$(BR2_BOARD_NAME)/$(BR2_BOARD_NAME)-linux26-$(BR2_LINUX26_VERSION).config"
 BR2_PACKAGE_LINUX_FORMAT="uImage"
diff --git a/configs/integrator926_huge_defconfig b/configs/integrator926_huge_defconfig
index 69f16de..eb4aa45 100644
--- a/configs/integrator926_huge_defconfig
+++ b/configs/integrator926_huge_defconfig
@@ -719,7 +719,6 @@ BR2_TARGET_UBOOT_CUSTOM_PATCH=""
 # BR2_KERNEL_none is not set
 BR2_KERNEL_LINUX_ADVANCED=y
 # BR2_KERNEL_LINUX is not set
-# BR2_KERNEL_HURD is not set
 BR2_PACKAGE_LINUX=y
 BR2_PACKAGE_LINUX_KCONFIG="$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-$(BR2_LINUX26_VERSION).config"
 BR2_PACKAGE_LINUX_FORMAT="uImage"
diff --git a/configs/kb9202_defconfig b/configs/kb9202_defconfig
index d41b30b..880af25 100644
--- a/configs/kb9202_defconfig
+++ b/configs/kb9202_defconfig
@@ -696,7 +696,6 @@ BR2_TARGET_ROOTFS_TAR_COPYTO=""
 # BR2_KERNEL_none is not set
 BR2_KERNEL_LINUX_ADVANCED=y
 # BR2_KERNEL_LINUX is not set
-# BR2_KERNEL_HURD is not set
 BR2_PACKAGE_LINUX=y
 BR2_PACKAGE_LINUX_KCONFIG="$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-$(BR2_LINUX26_VERSION).config"
 BR2_PACKAGE_LINUX_FORMAT="uImage"
diff --git a/configs/v100sc2_defconfig b/configs/v100sc2_defconfig
index e198353..1c43f11 100644
--- a/configs/v100sc2_defconfig
+++ b/configs/v100sc2_defconfig
@@ -752,4 +752,3 @@ BR2_TARGET_UBOOT_ETHADDR="04:25:fe:ed:00:18"
 BR2_KERNEL_none=y
 # BR2_KERNEL_LINUX_ADVANCED is not set
 # BR2_KERNEL_LINUX is not set
-# BR2_KERNEL_HURD is not set
diff --git a/scripts/test/Config.in.test.buildall b/scripts/test/Config.in.test.buildall
index 84c4de1..b5bb050 100644
--- a/scripts/test/Config.in.test.buildall
+++ b/scripts/test/Config.in.test.buildall
@@ -709,7 +709,6 @@ config BR2_TARGET_TEST_PACKAGES
 # BR2_KERNEL_none is not set
 	select BR2_KERNEL_LINUX_ADVANCED
 # BR2_KERNEL_LINUX is not set
-# BR2_KERNEL_HURD is not set
 	select BR2_PACKAGE_LINUX
 	select BR2_LINUX_2_6_28
 
-- 
1.6.3.3
