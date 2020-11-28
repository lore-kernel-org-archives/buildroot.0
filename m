From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Nov 2020 10:54:30 +0100
Subject: [Buildroot] [git commit] configs/bananapi_m2_zero: bump Linux and
 U-Boot versions
Message-ID: <20201203092227.AED47821E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9144f098edb9584bb86cd06c7da243ecb5a27a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump Linux kernel to 5.9.11 and U-Boot to 2020.10.

Signed-off-by: Vincent Stehl?? <vincent.stehle@laposte.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/bananapi_m2_zero_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/bananapi_m2_zero_defconfig b/configs/bananapi_m2_zero_defconfig
index e82814e336..e5c89fce40 100644
--- a/configs/bananapi_m2_zero_defconfig
+++ b/configs/bananapi_m2_zero_defconfig
@@ -1,13 +1,13 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_9=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Bananapi M2 Zero"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/bananapi/bananapi-m2-zero/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.9.11"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-bananapi-m2-zero"
@@ -17,7 +17,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="bananapi_m2_zero"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
