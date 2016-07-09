From: Georges Savoundararadj <savoundg@gmail.com>
Date: Fri,  8 Jul 2016 23:40:03 -0700
Subject: [Buildroot] [PATCH 4/5] imx6sololiteevk: use zImage
In-Reply-To: <20160709064004.8844-1-savoundg@gmail.com>
References: <20160709064004.8844-1-savoundg@gmail.com>
Message-ID: <20160709064004.8844-5-savoundg@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

U-Boot, with the default environment, is looking for a zImage.

Signed-off-by: Georges Savoundararadj <savoundg@gmail.com>
---
 configs/freescale_imx6sololiteevk_defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/configs/freescale_imx6sololiteevk_defconfig b/configs/freescale_imx6sololiteevk_defconfig
index 3827751..fa83f0c 100644
--- a/configs/freescale_imx6sololiteevk_defconfig
+++ b/configs/freescale_imx6sololiteevk_defconfig
@@ -14,8 +14,6 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.1.15_1.1.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
-BR2_LINUX_KERNEL_UIMAGE=y
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x80008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sl-evk"
 
-- 
2.9.0
