From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Tue,  3 Jul 2018 10:12:00 -0300
Subject: [Buildroot] [PATCH 3/4] configs/mx53loco: Bump to kernel 4.17.4
In-Reply-To: <1530623521-11432-1-git-send-email-fabio.estevam@nxp.com>
References: <1530623521-11432-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <1530623521-11432-3-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <festevam@gmail.com>

Kernel 4.17.4 contains commit 32c319d4f120 ("pinctrl: devicetree: Fix
pctldev pointer overwrite"), which fixes audio support
on imx53loco board, so bump to this kernel version.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/mx53loco_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/mx53loco_defconfig b/configs/mx53loco_defconfig
index b42b280..ca6ec44 100644
--- a/configs/mx53loco_defconfig
+++ b/configs/mx53loco_defconfig
@@ -28,7 +28,7 @@ BR2_TARGET_UBOOT_FORMAT_IMX=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.17"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.17.4"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx53-qsb imx53-qsrb"
-- 
2.7.4
