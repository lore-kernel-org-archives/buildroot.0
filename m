From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 12 Aug 2019 08:17:35 +0300
Subject: [Buildroot] [PATCH] configs/solidrun_clearfog: bump U-Boot to
 2019.07
Message-ID: <37593543049fd0255866302007c4b87092d270cc.1565587055.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes "SPL image too big" error.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/269139293

Cc: Jan Kundr?t <jan.kundrat@cesnet.cz>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 configs/solidrun_clearfog_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/solidrun_clearfog_defconfig b/configs/solidrun_clearfog_defconfig
index fd6f278aa13f..b73b9e8ecbb5 100644
--- a/configs/solidrun_clearfog_defconfig
+++ b/configs/solidrun_clearfog_defconfig
@@ -33,7 +33,7 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.11"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="clearfog"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.20.1
