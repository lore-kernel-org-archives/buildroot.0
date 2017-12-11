From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Dec 2017 20:20:45 +0100
Subject: [Buildroot] [git commit] zynq_zc706: u-boot: bump to xilinx-v2017.3
Message-ID: <20171211191702.783D58220B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d1e2a893b09862548bf3394e0cbc76d58ebd84f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Build-tested only]
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Alistair Francis <alistair.francis@xilinx.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/zynq_zc706_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index 378d19b..1dcccd5 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -20,7 +20,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2017.1"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2017.3"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_zc706"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
