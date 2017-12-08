From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Dec 2017 23:47:14 +0100
Subject: [Buildroot] [git commit] configs/orangepi-lite: bump Linux to 4.14.4
Message-ID: <20171208224514.5E08E82827@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0201bd7af65c45b0cc170d87c49ea4d2c24597d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: add explicit kernel headers selection]
Signed-off-by: Jan Kraval <jan.kraval@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/orangepi_lite_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/orangepi_lite_defconfig b/configs/orangepi_lite_defconfig
index b1f6598..30e4b1e 100644
--- a/configs/orangepi_lite_defconfig
+++ b/configs/orangepi_lite_defconfig
@@ -1,14 +1,14 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_Lite"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Lite"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/orangepi-lite/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/orangepi/orangepi-lite/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.4"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-lite/linux-extras.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
