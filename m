From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jun 2016 11:34:20 +0200
Subject: [Buildroot] [git commit] configs: mx53loco: Bump kernel version to
	4.6.2
Message-ID: <20160610093525.F06D682115@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4ab399188a9d435cb230bbf1dc836e83829e6ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kernel 4.6.2 contains commit 63d0430f991314 ("drm/imx: Match
imx-ipuv3-crtc components using device node in platform data")
that fixes IPUv3 probing, so bump to this kernel version.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
