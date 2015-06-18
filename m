From: Jan Viktorin <xvikto03@stud.fit.vutbr.cz>
Date: Thu, 18 Jun 2015 18:27:57 +0200
Subject: [Buildroot] [PATCH 1/2] zedboard: Upgrade to Linux xilinx-v2015.1
	(3.18)
Message-ID: <1434644878-595-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jan Viktorin <viktorin@rehivetech.com>

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
---
 configs/zedboard_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/zedboard_defconfig b/configs/zedboard_defconfig
index e0e7760..76688e9 100644
--- a/configs/zedboard_defconfig
+++ b/configs/zedboard_defconfig
@@ -8,7 +8,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2014.1"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2015.1"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.4.3
