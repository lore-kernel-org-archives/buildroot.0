From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Mon, 30 Mar 2020 19:23:00 +0200
Subject: [Buildroot] [PATCH v2 3/4] nanopi_neo4_defconfig: Bump kernel to 5.4
In-Reply-To: <1585588981-12498-1-git-send-email-marek.belisko@open-nandra.com>
References: <1585588981-12498-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <1585588981-12498-4-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 configs/nanopi_neo4_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/nanopi_neo4_defconfig b/configs/nanopi_neo4_defconfig
index 2bffe66..f68b5e2 100644
--- a/configs/nanopi_neo4_defconfig
+++ b/configs/nanopi_neo4_defconfig
@@ -2,8 +2,8 @@
 BR2_aarch64=y
 BR2_cortex_a72_a53=y
 
-# Linux headers same as kernel, a 5.2 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_2=y
+# Linux headers same as kernel, a 5.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
 
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
@@ -34,7 +34,7 @@ BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin tpl/u-boot-tpl-dtb.bin"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.18"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-nanopi-neo4"
-- 
2.7.4
