From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 23:28:33 +0200
Subject: [Buildroot] [git commit] imx6dlsabresd: use zImage
Message-ID: <20160911212946.661D281F75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a98a75693973d82c7bf3c0cfdc07342237b7f22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

U-Boot, with the default environment, is looking for a zImage.

Signed-off-by: Georges Savoundararadj <savoundg@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/freescale_imx6dlsabresd_defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/configs/freescale_imx6dlsabresd_defconfig b/configs/freescale_imx6dlsabresd_defconfig
index c01bf7a..7e42faa 100644
--- a/configs/freescale_imx6dlsabresd_defconfig
+++ b/configs/freescale_imx6dlsabresd_defconfig
@@ -17,8 +17,6 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.1.15_1.1.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
-BR2_LINUX_KERNEL_UIMAGE=y
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-sabresd"
 
