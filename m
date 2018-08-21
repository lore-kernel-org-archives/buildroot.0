From: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Date: Tue, 21 Aug 2018 17:55:08 +0200
Subject: [Buildroot] [PATCH] configs/arm_juno: bump ATF to v1.4
Message-ID: <6f2e602461e3242c52922294212467dee1ad486c.1534866579.git.gustavo.pimentel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to ATF v1.4 (tested on the actual hardware).

Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
---
 configs/arm_juno_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/arm_juno_defconfig b/configs/arm_juno_defconfig
index 98f2573..5832986 100644
--- a/configs/arm_juno_defconfig
+++ b/configs/arm_juno_defconfig
@@ -12,7 +12,7 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/juno arm/juno-r1 arm/juno-r2"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v1.3"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v1.4"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="juno"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
-- 
2.7.4
