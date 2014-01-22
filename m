From: Anders Darander <anders@chargestorm.se>
Date: Wed, 22 Jan 2014 12:25:30 +0100
Subject: [Buildroot] [PATCH 3/4] beaglebone: update to latest U-Boot
In-Reply-To: <1390389931-32589-1-git-send-email-anders@chargestorm.se>
References: <1390389931-32589-1-git-send-email-anders@chargestorm.se>
Message-ID: <1390389931-32589-4-git-send-email-anders@chargestorm.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to the default version of U-Boot, at this time 2013.10.

Tested with an old uEnv.txt (i.e. using uImage) and with the
currently prefered zImage.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 configs/beaglebone_defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index c19df67..85c0a8b 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -21,8 +21,6 @@ BR2_DEFAULT_KERNEL_VERSION="3.8.12"
 # bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="am335x_evm"
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2013.04"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="MLO"
-- 
1.8.5.3
