From: Georges Savoundararadj <savoundg@gmail.com>
Date: Wed,  7 Sep 2016 15:29:12 -0700
Subject: [Buildroot] [PATCH v2 5/5] imx6dlsabresd: use zImage
In-Reply-To: <20160907222912.26002-1-savoundg@gmail.com>
References: <20160709064004.8844-1-savoundg@gmail.com>
 <20160907222912.26002-1-savoundg@gmail.com>
Message-ID: <20160907222912.26002-5-savoundg@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

U-Boot, with the default environment, is looking for a zImage.

Signed-off-by: Georges Savoundararadj <savoundg@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>

---
Changes v1 -> v2:
  - No change

Signed-off-by: Georges Savoundararadj <savoundg@gmail.com>
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
 
-- 
2.9.3
