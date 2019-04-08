From: Shyam Saini <shyam.saini@amarulasolutions.com>
Date: Mon,  8 Apr 2019 20:40:52 +0530
Subject: [Buildroot] [PATCH 08/13] configs: orangepi_plus: Bump to u-boot
 version 2019.01
In-Reply-To: <20190408151057.14455-1-shyam.saini@amarulasolutions.com>
References: <20190408151057.14455-1-shyam.saini@amarulasolutions.com>
Message-ID: <20190408151057.14455-8-shyam.saini@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
---
 configs/orangepi_plus_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/orangepi_plus_defconfig b/configs/orangepi_plus_defconfig
index a34ff2c5cc..a5ca6a8c5f 100644
--- a/configs/orangepi_plus_defconfig
+++ b/configs/orangepi_plus_defconfig
@@ -14,7 +14,7 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Plus"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.05"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_plus"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-- 
2.11.0
