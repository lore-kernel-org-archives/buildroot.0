From: Shyam Saini <shyam.saini@amarulasolutions.com>
Date: Mon,  1 Apr 2019 19:13:03 +0530
Subject: [Buildroot] [PATCH 3/3] configs: engicam_imx6qdl_icore_rqs: Bump to
 u-boot 2019.01 version
In-Reply-To: <20190401134303.9177-1-shyam.saini@amarulasolutions.com>
References: <20190401134303.9177-1-shyam.saini@amarulasolutions.com>
Message-ID: <20190401134303.9177-3-shyam.saini@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
---
 configs/engicam_imx6qdl_icore_rqs_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/engicam_imx6qdl_icore_rqs_defconfig b/configs/engicam_imx6qdl_icore_rqs_defconfig
index f79ccac27e..45ed67be07 100644
--- a/configs/engicam_imx6qdl_icore_rqs_defconfig
+++ b/configs/engicam_imx6qdl_icore_rqs_defconfig
@@ -14,7 +14,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07-rc1"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6qdl_icore_rqs"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.11.0
