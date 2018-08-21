From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 23:18:16 +0200
Subject: [Buildroot] [git commit branch/next] configs/arm_juno: bump ATF to
 v1.4
Message-ID: <20180821211047.EBD228E201@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0e26eaa51c4119ca66a376a8ff7ca8f0d0392eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update to ATF v1.4 (tested on the actual hardware).

Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/arm_juno_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/arm_juno_defconfig b/configs/arm_juno_defconfig
index 98f257387d..5832986779 100644
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
