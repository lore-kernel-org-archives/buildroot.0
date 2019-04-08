From: Shyam Saini <shyam.saini@amarulasolutions.com>
Date: Mon,  8 Apr 2019 20:40:54 +0530
Subject: [Buildroot] [PATCH 10/13] configs: nanopi_m1: Bump to the linux
 kernel 5.0
In-Reply-To: <20190408151057.14455-1-shyam.saini@amarulasolutions.com>
References: <20190408151057.14455-1-shyam.saini@amarulasolutions.com>
Message-ID: <20190408151057.14455-10-shyam.saini@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This bumps to linux/linux-headers 5.0

Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
---
 configs/nanopi_m1_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/nanopi_m1_defconfig b/configs/nanopi_m1_defconfig
index 323015ee68..0e782dab64 100644
--- a/configs/nanopi_m1_defconfig
+++ b/configs/nanopi_m1_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
 
-# Linux headers same as kernel, a 4.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+# Linux headers same as kernel, a 5.0 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
 
 # System configuration
 BR2_TARGET_GENERIC_HOSTNAME="nanopi-m1"
@@ -24,7 +24,7 @@ BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-nanopi-m1"
-- 
2.11.0
