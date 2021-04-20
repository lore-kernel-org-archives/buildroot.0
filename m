From: Stephane Viau (OSS) <stephane.viau@oss.nxp.com>
Date: Tue, 20 Apr 2021 20:16:08 +0000
Subject: [Buildroot] [PATCH v2 5/6] package/freescale-imx/imx-seco: bump
 to version 3.7.5
In-Reply-To: <20210420082104.11514-5-sebastien.szymanski@armadeus.com>
References: <20210420082104.11514-1-sebastien.szymanski@armadeus.com>,
 <20210420082104.11514-5-sebastien.szymanski@armadeus.com>
Message-ID: <AM7PR04MB69498B711B3189462C0A4D66A7489@AM7PR04MB6949.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>
>- Same version as NXP release 5.10.9_1.0.0
>
>Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>

Reviewed-by: Stephane Viau <stephane.viau@oss.nxp.com>
[Stephane: tested on i.MX8MQXP-B0]
Tested-by: Stephane Viau <stephane.viau@oss.nxp.com>

>---
>
>Changes for v2:
> - none
>
> package/freescale-imx/imx-seco/imx-seco.hash | 2 +-
> package/freescale-imx/imx-seco/imx-seco.mk   | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/package/freescale-imx/imx-seco/imx-seco.hash b/package/freescale-imx/imx-seco/imx-seco.hash
>index 2e111c64d7..378c24bc54 100644
>--- a/package/freescale-imx/imx-seco/imx-seco.hash
>+++ b/package/freescale-imx/imx-seco/imx-seco.hash
>@@ -1,4 +1,4 @@
> # Locally calculated
>-sha256  2ed8177e48c8e33f742b3a642805be56a5ef56df78b1b29e10518552154da2bc  imx-seco-3.7.4.bin
>+sha256  08cf25a4be6841ca7264a50b29c311b386eae1c02fced8a3b55fd04213acb4bc  imx-seco-3.7.5.bin
> sha256  72edc2072c86d93aa1993d15d4d19d96270af3749b0108995ad50c81d1461f52  EULA
> sha256  9c16421e7c702f56756650b8ac954d34556327e598a8666e6e8f4eb3a1aa95f1  COPYING
>diff --git a/package/freescale-imx/imx-seco/imx-seco.mk b/package/freescale-imx/imx-seco/imx-seco.mk
>index f7aaca7e4b..245c3e3311 100644
>--- a/package/freescale-imx/imx-seco/imx-seco.mk
>+++ b/package/freescale-imx/imx-seco/imx-seco.mk
>@@ -4,7 +4,7 @@
> #
> ################################################################################
>
>-IMX_SECO_VERSION = 3.7.4
>+IMX_SECO_VERSION = 3.7.5
> IMX_SECO_SITE = $(FREESCALE_IMX_SITE)
> IMX_SECO_SOURCE = imx-seco-$(IMX_SECO_VERSION).bin
>
>--
>2.26.3
>
>
