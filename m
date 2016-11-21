From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2016 22:43:32 +0100
Subject: [Buildroot] [git commit] configs/imx28evk: Bump to kernel 4.8.8
Message-ID: <20161121214337.CDED9802B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cbc2fd07b0089e49ecad851bd2ac38f177111d8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kernel 4.8.8 brings commit 235bde1ed3f0ff ("net: fec: Call swap_buffer()
prior to IP header alignment"), which makes Ethernet functional again
on mx28.

Bump to this version.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/freescale_imx28evk_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/freescale_imx28evk_defconfig b/configs/freescale_imx28evk_defconfig
index 790c338..9c870cf 100644
--- a/configs/freescale_imx28evk_defconfig
+++ b/configs/freescale_imx28evk_defconfig
@@ -11,7 +11,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.8"
 BR2_LINUX_KERNEL_DEFCONFIG="mxs"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx28-evk"
