From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 26 May 2015 10:19:39 +0200
Subject: [Buildroot] [PATCH v2 10/13] nitrogen6x_defconfig: bump version to
	3.10.53_1.1.1_ga
In-Reply-To: <1432628382-16799-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1432628382-16799-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1432628382-16799-11-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also update the dtb files to be generated.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 configs/nitrogen6x_defconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index d75f780..d04745d 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -13,7 +13,7 @@ BR2_TARGET_ROOTFS_EXT2_2r1=y
 
 # Lock headers to match kernel
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.17"
+BR2_DEFAULT_KERNEL_VERSION="3.10.53"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
 
 # bootloader
@@ -21,15 +21,15 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="nitrogen6q"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-boot-imx6/tarball/f870252/u-boot-f870252.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-boot-imx6/tarball/21eb4146/u-boot-21eb4146.tar.gz"
 
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Last version of branch boundary-imx_3.10.17_1.0.1_ga
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/tarball/ea957c5/linux-imx6-ea957c5.tar.gz"
+# Last version of branch boundary-imx_3.10.53_1.1.1_ga
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/tarball/98c0fdbe/linux-imx6-98c0fdbe.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="nitrogen6x"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-nit6xlite imx6dl-nitrogen6_max imx6dl-nitrogen6x imx6q-nitrogen6_max imx6q-nitrogen6x imx6q-sabrelite"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-nit6xlite imx6dl-nitrogen6_vm imx6dl-nitrogen6x imx6q-nitrogen6x imx6q-nitrogen6_max imx6q-sabrelite"
-- 
2.1.4
