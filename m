From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Oct 2015 16:01:54 +0200
Subject: [Buildroot] [git commit] arm_foundationv8_defconfig: rely on
	default Image name for kernel
Message-ID: <20151005140259.4398C8016A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7dca662665ee02dafa6ee46fe24f352bc55982ab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/arm_foundationv8_defconfig |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

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
