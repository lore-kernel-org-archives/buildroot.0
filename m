From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 31 Mar 2020 17:12:05 -0300
Subject: [Buildroot] [PATCH] configs/mx53loco: Bump the kernel version
Message-ID: <20200331201205.29690-1-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump the kernel to the 5.4.27 version.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/mx53loco_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/mx53loco_defconfig b/configs/mx53loco_defconfig
index 8b78f65865..06f434e5de 100644
--- a/configs/mx53loco_defconfig
+++ b/configs/mx53loco_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_cortex_a8=y
 
-# Linux headers same as kernel, a 5.2 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_2=y
+# Linux headers same as kernel, a 5.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -28,7 +28,7 @@ BR2_TARGET_UBOOT_FORMAT_IMX=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.2.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.27"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx53-qsb imx53-qsrb"
-- 
2.17.1
