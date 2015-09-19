From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Sep 2015 15:40:43 +0200
Subject: [Buildroot] [git commit] nitrogen6x_defconfig: bump version to
	3.14.28-1.0.0
Message-ID: <20150919134124.332477FB61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b8e9b975701e2a964c246d31502a8ca6c9942177
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

U-Boot version is updated to v2015.07.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/nitrogen6x_defconfig |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 71b01f0..51c5161 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -14,21 +14,22 @@ BR2_TARGET_ROOTFS_EXT2_2r1=y
 
 # Lock headers to match kernel
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.53"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
+BR2_DEFAULT_KERNEL_VERSION="3.14.28"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="nitrogen6q"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-boot-imx6/tarball/21eb4146/u-boot-21eb4146.tar.gz"
+# Last version of branch boundary-v2015.07
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-boot-imx6/tarball/5115a9e/u-boot-5115a9e.tar.gz"
 
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Last version of branch boundary-imx_3.10.53_1.1.1_ga
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/tarball/98c0fdbe/linux-imx6-98c0fdbe.tar.gz"
+# Last version of branch boundary-imx_3.14.28_1.0.0_ga
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/tarball/3417c66/linux-imx6-3417c66.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="nitrogen6x"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
