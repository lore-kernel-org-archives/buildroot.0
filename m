From: shyam saini <mayhs11saini@gmail.com>
Date: Thu, 10 May 2018 00:23:41 +0530
Subject: [Buildroot] [PATCH] configs: amarula: vyasa: bump u-boot version to
 v2018.11
Message-ID: <1525892021-6706-1-git-send-email-mayhs11saini@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jagan Teki <jagan@amarulasolutions.com>

bump the U-Boot stable version to v2018.11

Tested-by: Shyam Saini <shyam@amarulasolutions.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 configs/amarula_vyasa_rk3288_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/amarula_vyasa_rk3288_defconfig b/configs/amarula_vyasa_rk3288_defconfig
index ccaab9551e9c..88fb6abbec0f 100644
--- a/configs/amarula_vyasa_rk3288_defconfig
+++ b/configs/amarula_vyasa_rk3288_defconfig
@@ -10,7 +10,7 @@ BR2_KERNEL_HEADERS_4_14=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.03"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="vyasa-rk3288"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
1.9.1
