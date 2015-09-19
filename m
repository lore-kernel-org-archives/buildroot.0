From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Sep 2015 15:40:38 +0200
Subject: [Buildroot] [git commit] qmx6_defconfig: bump version to
	3.14.28_1.0.0
Message-ID: <20150919134124.2987D7FB61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=666e89b93443c416ec6da37eaed6838b05f7b1bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/qmx6_defconfig |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/configs/qmx6_defconfig b/configs/qmx6_defconfig
index d693d82..a829b4c 100644
--- a/configs/qmx6_defconfig
+++ b/configs/qmx6_defconfig
@@ -1,17 +1,17 @@
 BR2_arm=y
 BR2_cortex_a9=y
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.53"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
+BR2_DEFAULT_KERNEL_VERSION="3.14.28"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
 
 # Notice you need a recent version of u-boot (with DT support) to be able
 # to boot this kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.congatec.com/arm/qmx6_kernel.git"
-# Last version of branch cgt_imx_3.10.53_1.1.0
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="cea0de46e2c8f0a5c67f46005e84ae1d418731bc"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.congatec.com/arm/imx6_kernel_3.14.git"
+# Last version of branch cgt_qmx6_3.14.28_1.0.0
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="105820d6bd251deb49c3dd3f71fa0d76adce97c7"
 BR2_LINUX_KERNEL_DEFCONFIG="qmx6"
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -23,7 +23,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="cgt_qmx6_pn016103"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://git.congatec.com/arm/qmx6_uboot.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="30ba236ef6df04e4cca58c3e06c4f63c2db12115"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="4d3b64e93064ed3d97ef7d91ff0f61a693a460fc"
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.pn016103.imx"
 
