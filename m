From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 4 Oct 2015 17:28:17 +0100
Subject: [Buildroot] [PATCH 3/3] arm_foundationv8_defconfig: rely on default
	Image name for kernel
In-Reply-To: <1443976097-27522-1-git-send-email-arnout@mind.be>
References: <1443976097-27522-1-git-send-email-arnout@mind.be>
Message-ID: <1443976097-27522-3-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 configs/arm_foundationv8_defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/configs/arm_foundationv8_defconfig b/configs/arm_foundationv8_defconfig
index 2280792..dbaf3d6 100644
--- a/configs/arm_foundationv8_defconfig
+++ b/configs/arm_foundationv8_defconfig
@@ -6,8 +6,6 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(LINUX_DIR)/arch/arm64/configs/defconfig"
-BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="foundation-v8"
 BR2_TARGET_ROOTFS_EXT2=y
-- 
2.5.3
