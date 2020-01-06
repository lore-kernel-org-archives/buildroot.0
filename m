From: Fabio Estevam <festevam@gmail.com>
Date: Mon,  6 Jan 2020 19:46:47 -0300
Subject: [Buildroot] [PATCH] configs/imx6ulevk: Bump the kernel version
Message-ID: <20200106224647.15233-1-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump the kernel version to 5.4.8.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx6ulevk_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/imx6ulevk_defconfig b/configs/imx6ulevk_defconfig
index 9e30d2c3c4..53381d71a7 100644
--- a/configs/imx6ulevk_defconfig
+++ b/configs/imx6ulevk_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 4.18 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
+# Linux headers same as kernel, a 5.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -12,7 +12,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.8"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-14x14-evk"
-- 
2.17.1
