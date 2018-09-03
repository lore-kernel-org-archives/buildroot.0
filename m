From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon,  3 Sep 2018 10:26:11 +0200
Subject: [Buildroot] [PATCH 3/4] configs: bpi-m64: Use Mainline ARM ATF
In-Reply-To: <1535963172-6664-1-git-send-email-jagan@amarulasolutions.com>
References: <1535963172-6664-1-git-send-email-jagan@amarulasolutions.com>
Message-ID: <1535963172-6664-3-git-send-email-jagan@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use Mainline ARM ATF for bananapi-m64 board instead
Andre's github.

Cc: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 configs/bananapi_m64_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/bananapi_m64_defconfig b/configs/bananapi_m64_defconfig
index 7d1ed18..db39903 100644
--- a/configs/bananapi_m64_defconfig
+++ b/configs/bananapi_m64_defconfig
@@ -8,9 +8,9 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/apritzel/arm-trusted-firmware.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50iw1p1"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="aa75c8da415158a94b82a430b2b40000778e851f"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="cffb00342897ed73a2bb9fc7a1860102bd927f2e"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 
 # Bootloader
-- 
1.9.1
