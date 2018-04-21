From: Aleksey Kislitsa <aleksey.kislitsa@gmail.com>
Date: Sat, 21 Apr 2018 11:24:03 +0300
Subject: [Buildroot] [PATCH 2/2] Has been added configs for OrangePI-2G-IOT
 Has been removed blob modem.bin. Has beenadded script for loading this blob
 at build time
In-Reply-To: <20180421082403.11536-1-aleksey.kislitsa@gmail.com>
References: <20180421082403.11536-1-aleksey.kislitsa@gmail.com>
Message-ID: <20180421082403.11536-2-aleksey.kislitsa@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Aleksey Kislitsa <aleksey.kislitsa@gmail.com>
---
 configs/orangepi_2g-iot_defconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/configs/orangepi_2g-iot_defconfig b/configs/orangepi_2g-iot_defconfig
index 1dabce9c12..05d84cd19c 100644
--- a/configs/orangepi_2g-iot_defconfig
+++ b/configs/orangepi_2g-iot_defconfig
@@ -21,8 +21,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
-#BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/RDA8810/u-boot-RDA8810.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="board/orangepi/orangepi-2g-iot/patches/u-boot"
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/orangepi-xunlong/OrangePiRDA_uboot.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="master"
 BR2_TARGET_UBOOT_PATCH="board/orangepi/orangepi-2g-iot/patches/u-boot"
 BR2_TARGET_UBOOT_BOARDNAME="rda8810"
-- 
2.11.0
