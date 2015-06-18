From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jun 2015 23:15:17 +0200
Subject: [Buildroot] [git commit] zedboard: Upgrade to Linux xilinx-v2015.1
	(3.18)
Message-ID: <20150618211524.6F69F81E42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fc0345a9a24e92d86b212c54aae0e7670307c831
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/zedboard_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
