From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Dec 2017 20:18:05 +0100
Subject: [Buildroot] [git commit] zynq_microzed: u-boot: bump to
 xilinx-v2017.3
Message-ID: <20171211191702.5F9C080FE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2aa43ea4e43e772d62499f4929fac2e98443736
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Build-tested only]
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Alistair Francis <alistair.francis@xilinx.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/zynq_microzed_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index a3c25f9..acd2da5 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -20,7 +20,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2017.1"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2017.3"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_microzed"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
