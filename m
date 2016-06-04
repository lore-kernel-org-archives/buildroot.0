From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sat,  4 Jun 2016 18:29:08 -0300
Subject: [Buildroot] [PATCH 1/2] beaglebone: Use default U-Boot version
Message-ID: <1465075749-31837-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There's no reason to use a specific U-Boot version, given
we are using upstream. Leave the default version get selected.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 configs/beaglebone_defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index be803b9cce30..b9d78a9fb25b 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -20,8 +20,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
 # bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="am335x_evm"
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2013.10"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="MLO"
-- 
2.7.0
