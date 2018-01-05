From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri,  5 Jan 2018 15:39:46 +0100
Subject: [Buildroot] [PATCH v2 14/15] configs: nitrogen*: bump kernel
 version to 4.9.x_1.0.0_ga
In-Reply-To: <20180105143947.26934-1-gary.bisson@boundarydevices.com>
References: <20180105143947.26934-1-gary.bisson@boundarydevices.com>
Message-ID: <20180105143947.26934-15-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently based upon 4.9.74 stable release.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 configs/nitrogen6sx_defconfig | 8 ++++----
 configs/nitrogen6x_defconfig  | 8 ++++----
 configs/nitrogen7_defconfig   | 8 ++++----
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index fc568fbbd2..03c8f9a01e 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -17,8 +17,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
-# Linux headers same as kernel, a 4.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
@@ -31,8 +31,8 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-b
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Last version of branch boundary-imx_4.1.15_2.0.0_ga
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8b305512.tar.gz"
+# Last version of branch boundary-imx_4.9.x_1.0.0_ga
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/2aef1ef6.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 43ff7088a7..049c68451b 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -17,8 +17,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
-# Linux headers same as kernel, a 4.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
@@ -31,8 +31,8 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-b
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Last version of branch boundary-imx_4.1.15_2.0.0_ga
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8b305512.tar.gz"
+# Last version of branch boundary-imx_4.9.x_1.0.0_ga
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/2aef1ef6.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
index da5938b09c..3b50828bce 100644
--- a/configs/nitrogen7_defconfig
+++ b/configs/nitrogen7_defconfig
@@ -16,8 +16,8 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
-# Linux headers same as kernel, a 4.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
@@ -30,8 +30,8 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-b
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Last version of branch boundary-imx_4.1.15_2.0.0_ga
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8b305512.tar.gz"
+# Last version of branch boundary-imx_4.9.x_1.0.0_ga
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/2aef1ef6.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.15.1
