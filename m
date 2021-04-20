From: Stephane Viau (OSS) <stephane.viau@oss.nxp.com>
Date: Tue, 20 Apr 2021 20:15:47 +0000
Subject: [Buildroot] [PATCH v2 4/6] package/freescale-imx/imx-gpu-g2d:
 bump to version 6.4.3.p1.2
In-Reply-To: <20210420082104.11514-4-sebastien.szymanski@armadeus.com>
References: <20210420082104.11514-1-sebastien.szymanski@armadeus.com>,
 <20210420082104.11514-4-sebastien.szymanski@armadeus.com>
Message-ID: <AM7PR04MB6949BAA241F232270D1B643DA7489@AM7PR04MB6949.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



>- Same version as NXP release 5.10.9_1.0.0
>- EULA/COPYING: update to LA_OPT_NXP_Software_License v19
>
>Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>

Reviewed-by: Stephane Viau <stephane.viau@oss.nxp.com>

>---
>
>Changes for v2:
> - none
>
> package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash | 8 ++++----
> package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk   | 4 ++--
> 2 files changed, 6 insertions(+), 6 deletions(-)
>
>diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
>index 8bfd302b16..4f05ca78b0 100644
>--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
>+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
>@@ -1,5 +1,5 @@
> # Locally calculated
>-sha256 8d3b024151d4bdcc4f68cdbba9c4e5d126d55c9258de5821c43b393ae3f840b4  imx-gpu-g2d-6.4.3.p1.0-arm.bin
>-sha256 47a39b171d83bced378b1b4f408be6304850fe2f25bf4577dd1ea78e22473f3d  imx-gpu-g2d-6.4.3.p1.0-aarch64.bin
>-sha256 9c16421e7c702f56756650b8ac954d34556327e598a8666e6e8f4eb3a1aa95f1  COPYING
>-sha256 72edc2072c86d93aa1993d15d4d19d96270af3749b0108995ad50c81d1461f52  EULA
>+sha256  9fd1b2c05ecabb3cc1468c357fc85f024a736de54abb9942e17230f24fa280c0  imx-gpu-g2d-6.4.3.p1.2-arm.bin
>+sha256  1b0369e9f75bf8fff7b8a86ade8d0d1748a52579b02ef72e53ad5565eee4dc60  imx-gpu-g2d-6.4.3.p1.2-aarch64.bin
>+sha256  4f3cc2dcbe3b7369bd4a51df749f432b69d8189fc2bde88f9fadbec73c686683  COPYING
>+sha256  a07e8df685161553d7e0b78b8b93ebe9086d95bb8635abff0ed3247992181e85  EULA
>diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
>index 3e6c3fc1c5..12f881105d 100644
>--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
>+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
>@@ -5,9 +5,9 @@
> ################################################################################
>
> ifeq ($(BR2_aarch64),y)
>-IMX_GPU_G2D_VERSION = 6.4.3.p1.0-aarch64
>+IMX_GPU_G2D_VERSION = 6.4.3.p1.2-aarch64
> else
>-IMX_GPU_G2D_VERSION = 6.4.3.p1.0-arm
>+IMX_GPU_G2D_VERSION = 6.4.3.p1.2-arm
> endif
> IMX_GPU_G2D_SITE = $(FREESCALE_IMX_SITE)
> IMX_GPU_G2D_SOURCE = imx-gpu-g2d-$(IMX_GPU_G2D_VERSION).bin
>--
>2.26.3
>
>
