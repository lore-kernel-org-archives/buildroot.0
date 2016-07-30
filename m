From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jul 2016 18:13:58 +0200
Subject: [Buildroot] [git commit] zynq_zc706: bump Linux to xilinx-v2016.2
Message-ID: <20160730161615.A1EF881744@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=deca6577097b0399acbd6f9ea027ea5ab8600eb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the latest release tag in the Xilinx repository, based on
Linux v4.4 in the mainline.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/zynq_zc706_defconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index 2dc4adb..746abcb 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -2,13 +2,12 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_ENABLE_NEON=y
-# Linux headers same as kernel, a 3.14 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Xilinx/linux-xlnx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2014.2.01"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2016.2"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
