From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Dec 2017 20:20:42 +0100
Subject: [Buildroot] [git commit] zynq_zc706: linux: bump to xilinx-v2017.3
 (based on 4.9)
Message-ID: <20171211191702.6C3F88220B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1fa982ec075388f15773872180afdea261421502
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Build-tested only]
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Alistair Francis <alistair.francis@xilinx.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/zynq_zc706_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index 86dea63..378d19b 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -2,12 +2,12 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Xilinx/linux-xlnx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2016.2"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2017.3"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
