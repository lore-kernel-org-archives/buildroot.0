From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Jul 2018 21:40:38 +0200
Subject: [Buildroot] [git commit] configs/mx53loco: Bump to kernel 4.17.4
Message-ID: <20180703193748.61FD684397@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55eb96a26a4fb3662116e6b0111e0250dd489727
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kernel 4.17.4 contains commit 32c319d4f120 ("pinctrl: devicetree: Fix
pctldev pointer overwrite"), which fixes audio support
on imx53loco board, so bump to this kernel version.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/mx53loco_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/mx53loco_defconfig b/configs/mx53loco_defconfig
index b42b280f80..ca6ec446f1 100644
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
