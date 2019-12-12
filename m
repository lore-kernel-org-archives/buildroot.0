From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Dec 2019 21:55:03 +0100
Subject: [Buildroot] [git commit] configs/imx7d-sdb: bump U-Boot and kernel
 versions
Message-ID: <20191212204630.DA3168A35F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1021823db9eafe44e7b5009c4d49f419fd1607ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump kernel to 5.4.1 version and U-Boot to 2019.10.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/imx7d-sdb_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/imx7d-sdb_defconfig b/configs/imx7d-sdb_defconfig
index b9983e34a4..e855384075 100644
--- a/configs/imx7d-sdb_defconfig
+++ b/configs/imx7d-sdb_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.2 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_2=y
+# Linux headers same as kernel, a 5.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -12,7 +12,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.2.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.1"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7d-sdb"
@@ -22,7 +22,7 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx7dsabresd"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
 BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
 
 # Filesystem
