From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat,  9 Dec 2017 22:30:05 +0100
Subject: [Buildroot] [PATCH 7/9] zynq_zc706: u-boot: bump to xilinx-v2017.3
In-Reply-To: <1512855007-1834-1-git-send-email-luca@lucaceresoli.net>
References: <1512855007-1834-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1512855007-1834-8-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[Build-tested only]
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 configs/zynq_zc706_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index 378d19b2ac5f..1dcccd5635ac 100644
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
-- 
2.7.4
