From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Dec 2017 20:16:53 +0100
Subject: [Buildroot] [git commit] zynq_zed: u-boot: bump to xilinx-v2017.3
Message-ID: <20171211191702.456A68220B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2b0be78f1bdf6b8040b17668db6b79f1fa2a7d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Run-time tested]
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Alistair Francis <alistair.francis@xilinx.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/zynq_zed_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index 1b03ad9..cd81598 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -20,7 +20,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2017.1"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2017.3"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_zed"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
