From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Feb 2018 22:05:39 +0100
Subject: [Buildroot] [git commit] configs/toradex_apalis_imx6: bump U-Boot
 and kernel to the official image version 2.7
Message-ID: <20180204215121.DB14588394@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8fea679cc27c08898f290c61ece17178b17e0a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to the following guide:
https://developer.toradex.com/knowledge-base/build-u-boot-and-linux-kernel-from-source-code#iMX_6_Based_Modules_ApalisColibri_iMX6

The official final 2.7 version released at 2018-01-04, see the following link:
https://developer.toradex.com/software/linux/linux-software/release-details

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/toradex_apalis_imx6_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/toradex_apalis_imx6_defconfig b/configs/toradex_apalis_imx6_defconfig
index 607faaeb8f..b7ef980492 100644
--- a/configs/toradex_apalis_imx6_defconfig
+++ b/configs/toradex_apalis_imx6_defconfig
@@ -6,7 +6,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/toradex/apalis-imx6/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.toradex.com/linux-toradex.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="3f68dc7c600c0354f5df7f06b931661319addafb"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="18717e2b1ca9b0fbf8bafa2717719e1f2c8f1114"
 BR2_LINUX_KERNEL_DEFCONFIG="apalis_imx6"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-apalis-eval imx6q-apalis-ixora imx6q-apalis_v1_0-eval imx6q-apalis_v1_0-ixora"
@@ -17,7 +17,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.toradex.com/u-boot-toradex.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="f0e414972b5b225e33ebe75574562266116746f9"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="30a1208727729dae22cb42f9ba9ba17efe5e6f77"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="apalis_imx6"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
