From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  4 Mar 2018 22:31:34 +0100
Subject: [Buildroot] [PATCH 20/23] configs/imx6ulevk: U-Boot needs host-dtc
In-Reply-To: <20180304213137.24681-1-thomas.petazzoni@bootlin.com>
References: <20180304213137.24681-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180304213137.24681-21-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/55306824

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/imx6ulevk_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/imx6ulevk_defconfig b/configs/imx6ulevk_defconfig
index 0ae6b5308e..069f8cfc5e 100644
--- a/configs/imx6ulevk_defconfig
+++ b/configs/imx6ulevk_defconfig
@@ -25,6 +25,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
 
 # required tools to create the SD card image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.14.3
