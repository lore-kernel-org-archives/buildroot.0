From: Shyam Saini <shyam.saini@amarulasolutions.com>
Date: Mon,  8 Apr 2019 20:40:50 +0530
Subject: [Buildroot] [PATCH 06/13] configs: olimex_a64_olinuxino: Bump to
 u-boot version 2019.01
In-Reply-To: <20190408151057.14455-1-shyam.saini@amarulasolutions.com>
References: <20190408151057.14455-1-shyam.saini@amarulasolutions.com>
Message-ID: <20190408151057.14455-6-shyam.saini@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
---
 configs/olimex_a64_olinuxino_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/olimex_a64_olinuxino_defconfig b/configs/olimex_a64_olinuxino_defconfig
index 3dbf158c18..6838be7203 100644
--- a/configs/olimex_a64_olinuxino_defconfig
+++ b/configs/olimex_a64_olinuxino_defconfig
@@ -17,7 +17,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="a64-olinuxino"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-- 
2.11.0
