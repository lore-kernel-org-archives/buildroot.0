From: Stephane Viau (OSS) <stephane.viau@oss.nxp.com>
Date: Tue, 20 Apr 2021 20:15:31 +0000
Subject: [Buildroot] [PATCH v2 3/6] package/freescale-imx/imx-gpu-viv:
 bump to version 6.4.3.p1.2
In-Reply-To: <20210420082104.11514-3-sebastien.szymanski@armadeus.com>
References: <20210420082104.11514-1-sebastien.szymanski@armadeus.com>,
 <20210420082104.11514-3-sebastien.szymanski@armadeus.com>
Message-ID: <AM7PR04MB6949B2C37D6090B8BA1029C0A7489@AM7PR04MB6949.eurprd04.prod.outlook.com>
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
>Changes for v2:
> - none
>
> package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash | 8 ++++----
> package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   | 4 ++--
> 2 files changed, 6 insertions(+), 6 deletions(-)
>
>diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
>index 9c18103996..6c0dacba60 100644
>--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
>+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
>@@ -1,5 +1,5 @@
> # Locally calculated
>-sha256 9960fadbc1ea919f8b1b5c1e2e38a52b7293b70c906518d7fff2ada4140c59ea  imx-gpu-viv-6.4.3.p1.0-aarch32.bin
>-sha256 0505620c3851a980d2e08fee4b4fcd06eff92efac02d1646924bea86e4384ad4  imx-gpu-viv-6.4.3.p1.0-aarch64.bin
>-sha256 9c16421e7c702f56756650b8ac954d34556327e598a8666e6e8f4eb3a1aa95f1  COPYING
>-sha256 72edc2072c86d93aa1993d15d4d19d96270af3749b0108995ad50c81d1461f52  EULA
>+sha256  0f139f5544250a3059c0a0266d44f70e89632694861de3e186272b170b37c464  imx-gpu-viv-6.4.3.p1.2-aarch32.bin
>+sha256  3de60afb1f54c0888d9849c5a27f938ba229f9f35675456a173bdf00e3538c5d  imx-gpu-viv-6.4.3.p1.2-aarch64.bin
>+sha256  4f3cc2dcbe3b7369bd4a51df749f432b69d8189fc2bde88f9fadbec73c686683  COPYING
>+sha256  a07e8df685161553d7e0b78b8b93ebe9086d95bb8635abff0ed3247992181e85  EULA
>diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
>index 6ae9aa7acc..802ac26c1c 100644
>--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
>+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
>@@ -5,9 +5,9 @@
> ################################################################################
>
> ifeq ($(BR2_aarch64),y)
>-IMX_GPU_VIV_VERSION = 6.4.3.p1.0-aarch64
>+IMX_GPU_VIV_VERSION = 6.4.3.p1.2-aarch64
> else
>-IMX_GPU_VIV_VERSION = 6.4.3.p1.0-aarch32
>+IMX_GPU_VIV_VERSION = 6.4.3.p1.2-aarch32
> endif
> IMX_GPU_VIV_SITE = $(FREESCALE_IMX_SITE)
> IMX_GPU_VIV_SOURCE = imx-gpu-viv-$(IMX_GPU_VIV_VERSION).bin
>--
>2.26.3
>
>
