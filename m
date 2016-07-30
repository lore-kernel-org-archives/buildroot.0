From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jul 2016 18:10:54 +0200
Subject: [Buildroot] [git commit] zynq_zed: bump Linux to xilinx-v2016.2
Message-ID: <20160730161615.7AA8F81744@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=291f8397cd2cf21b5759f9ca4b52bdeaef6bf872
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the latest release tag in the Xilinx repository, based on
Linux v4.4 in the mainline.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/zynq_zed_defconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index d3cfa70..98b010e 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -1,13 +1,12 @@
 BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
-# Linux headers same as kernel, a 3.18 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Xilinx/linux-xlnx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2015.1"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2016.2"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
