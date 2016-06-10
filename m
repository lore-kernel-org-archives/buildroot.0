From: Fabio Estevam <festevam@gmail.com>
Date: Thu,  9 Jun 2016 23:14:24 -0300
Subject: [Buildroot] [PATCH 1/2] configs: mx53loco: Bump kernel version to
	4.6.2
Message-ID: <1465524865-13105-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <fabio.estevam@nxp.com>

Kernel 4.6.2 contains commit 63d0430f991314 ("drm/imx: Match
imx-ipuv3-crtc components using device node in platform data")
that fixes IPUv3 probing, so bump to this kernel version.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 configs/mx53loco_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/mx53loco_defconfig b/configs/mx53loco_defconfig
index b62172c..72389e4 100644
--- a/configs/mx53loco_defconfig
+++ b/configs/mx53loco_defconfig
@@ -31,7 +31,7 @@ BR2_TARGET_UBOOT_FORMAT_IMX=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.2"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx53-qsb imx53-qsrb"
-- 
1.9.1
