From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Apr 2021 15:47:06 +0200
Subject: [Buildroot] [git commit] configs/amarula_vyasa_rk3288: bump u-boot
 version to 2021.01
Message-ID: <20210403132223.0307C8A3C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=335311831e700398ef30780076a675d248d6aff8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/amarula_vyasa_rk3288_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/amarula_vyasa_rk3288_defconfig b/configs/amarula_vyasa_rk3288_defconfig
index 760ad3f9f4..3403589253 100644
--- a/configs/amarula_vyasa_rk3288_defconfig
+++ b/configs/amarula_vyasa_rk3288_defconfig
@@ -10,7 +10,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="vyasa-rk3288"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
