From: Stephane Viau (OSS) <stephane.viau@oss.nxp.com>
Date: Tue, 20 Apr 2021 20:14:41 +0000
Subject: [Buildroot] [PATCH v2 1/6]
 package/freescale-imx/imx-vpu-hantro: bump version to 1.21.0
In-Reply-To: <20210420082104.11514-1-sebastien.szymanski@armadeus.com>
References: <20210420082104.11514-1-sebastien.szymanski@armadeus.com>
Message-ID: <AM7PR04MB694938BDF34D595DA64F68BCA7489@AM7PR04MB6949.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



>
>- Same version as NXP release 5.10.9_1.0.0
>- EULA/COPYING: update to LA_OPT_NXP_Software_License v19
>
>Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>

Reviewed-by: Stephane Viau <stephane.viau@oss.nxp.com>

>---
>
>Changes for v2
> - none
>
> package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash | 7 ++++---
> package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk   | 2 +-
> 2 files changed, 5 insertions(+), 4 deletions(-)
>
>diff --git a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
>index df9916e418..e9df63bfca 100644
>--- a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
>+++ b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
>@@ -1,3 +1,4 @@
>-sha256  261cab83954bd66e95b1650a737cb36261a2098597d904e517da638097ed4fd2  imx-vpu-hantro-1.19.0.bin
>-sha256  69cbb76b3f10ac5a8c36f34df7bbdf50825815560c00a946fff2922365ef01a2  COPYING
>-sha256  a39da2e94bd8b99eaac4325633854620ea3a55145259c3a7748c610a80714cfc  EULA
>+# Locally computed:
>+sha256  419725f0c09f5939c88cd234b729c3943cbd37e53db7352b02c8d6cc05b939b9  imx-vpu-hantro-1.21.0.bin
>+sha256  4f3cc2dcbe3b7369bd4a51df749f432b69d8189fc2bde88f9fadbec73c686683  COPYING
>+sha256  a07e8df685161553d7e0b78b8b93ebe9086d95bb8635abff0ed3247992181e85  EULA
>diff --git a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
>index 1d21449c20..0d075c49c0 100644
>--- a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
>+++ b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
>@@ -4,7 +4,7 @@
> #
> ################################################################################
>
>-IMX_VPU_HANTRO_VERSION = 1.19.0
>+IMX_VPU_HANTRO_VERSION = 1.21.0
> IMX_VPU_HANTRO_SITE = $(FREESCALE_IMX_SITE)
> IMX_VPU_HANTRO_SOURCE = imx-vpu-hantro-$(IMX_VPU_HANTRO_VERSION).bin
> IMX_VPU_HANTRO_DEPENDENCIES = linux
>--
>2.26.3
>
>
