From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Jul 2020 15:03:17 +0200
Subject: [Buildroot] [git commit] configs/arm_foundationv8: use
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG
Message-ID: <20200705130023.5729E84E19@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb242c1576abb01d1201aa48643319b386046eb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 53ced1f6d3da ("linux: allow the selection of the architecture's
default configuration") allows us to specify the Linux defconfig
cleanly.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/arm_foundationv8_defconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/configs/arm_foundationv8_defconfig b/configs/arm_foundationv8_defconfig
index d31f69d3ac..ea19f35502 100644
--- a/configs/arm_foundationv8_defconfig
+++ b/configs/arm_foundationv8_defconfig
@@ -5,8 +5,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.3"
-BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(LINUX_DIR)/arch/arm64/configs/defconfig"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/foundation-v8"
 BR2_TARGET_ROOTFS_EXT2=y
