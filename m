From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 13:16:34 +0200
Subject: [Buildroot] [git commit] qmx6_defconfig: bump version to
	3.10.53_1.1.0
Message-ID: <20150711112619.EC3017FF5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=49f9efc4a6bad3e4307c6e8eb160d40d0620e7c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/qmx6_defconfig |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/qmx6_defconfig b/configs/qmx6_defconfig
index ff035a9..d693d82 100644
--- a/configs/qmx6_defconfig
+++ b/configs/qmx6_defconfig
@@ -1,7 +1,7 @@
 BR2_arm=y
 BR2_cortex_a9=y
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.17"
+BR2_DEFAULT_KERNEL_VERSION="3.10.53"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
 
@@ -10,8 +10,8 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.congatec.com/arm/qmx6_kernel.git"
-# Last version of branch cgt_imx_3.10.17_1.0.0
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="9bafbcba67f7bb2a48a5e05998cecb1165aa444f"
+# Last version of branch cgt_imx_3.10.53_1.1.0
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="cea0de46e2c8f0a5c67f46005e84ae1d418731bc"
 BR2_LINUX_KERNEL_DEFCONFIG="qmx6"
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -23,7 +23,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="cgt_qmx6_pn016103"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://git.congatec.com/arm/qmx6_uboot.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="6388c474189b42c07bb865dd604c74483da099f3"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="30ba236ef6df04e4cca58c3e06c4f63c2db12115"
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.pn016103.imx"
 
