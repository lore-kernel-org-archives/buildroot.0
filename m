From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Sep 2017 22:10:04 +0200
Subject: [Buildroot] [git commit] orangepi_pc: bump linux to 4.13.3
Message-ID: <20170928200649.201B27F9D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a56d5d2fefb967a99e0b0143c52cbee85d8afffe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/orangepi_pc_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/orangepi_pc_defconfig b/configs/orangepi_pc_defconfig
index 471d95a..9c6ce1b 100644
--- a/configs/orangepi_pc_defconfig
+++ b/configs/orangepi_pc_defconfig
@@ -1,14 +1,14 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_PC"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi PC"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/orangepi-pc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/orangepi/orangepi-pc/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.3"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-pc"
