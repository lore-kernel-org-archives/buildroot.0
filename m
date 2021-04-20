From: Stephane Viau (OSS) <stephane.viau@oss.nxp.com>
Date: Tue, 20 Apr 2021 20:15:23 +0000
Subject: [Buildroot] [PATCH v2 2/6] package/freescale-imx/firmware-imx:
 bump version to 8.11
In-Reply-To: <20210420082104.11514-2-sebastien.szymanski@armadeus.com>
References: <20210420082104.11514-1-sebastien.szymanski@armadeus.com>,
 <20210420082104.11514-2-sebastien.szymanski@armadeus.com>
Message-ID: <AM7PR04MB694931550528B199FF5886EAA7489@AM7PR04MB6949.eurprd04.prod.outlook.com>
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
> - remove trailing space
>
> package/freescale-imx/firmware-imx/firmware-imx.hash | 6 +++---
> package/freescale-imx/firmware-imx/firmware-imx.mk   | 2 +-
> 2 files changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
>index 0a717d40f5..c434ce7ebd 100644
>--- a/package/freescale-imx/firmware-imx/firmware-imx.hash
>+++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
>@@ -1,4 +1,4 @@
> # Locally calculated
>-sha256  2b70f169d4065b2a7ac7a676afe24636128bd2dacc9f5230346758c3b146b2be  firmware-imx-8.10.bin
>-sha256  72edc2072c86d93aa1993d15d4d19d96270af3749b0108995ad50c81d1461f52  EULA
>-sha256  9c16421e7c702f56756650b8ac954d34556327e598a8666e6e8f4eb3a1aa95f1  COPYING
>+sha256  1a7aaab69cd8c48d10ffb0118c938f4b3daf4c7fd86f0342f4d352906f8e0ecb  firmware-imx-8.11.bin
>+sha256  4f3cc2dcbe3b7369bd4a51df749f432b69d8189fc2bde88f9fadbec73c686683  COPYING
>+sha256  a07e8df685161553d7e0b78b8b93ebe9086d95bb8635abff0ed3247992181e85  EULA
>diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
>index 6d82ea2077..1076cf85f1 100644
>--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
>+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
>@@ -4,7 +4,7 @@
> #
> ################################################################################
>
>-FIRMWARE_IMX_VERSION = 8.10
>+FIRMWARE_IMX_VERSION = 8.11
> FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
> FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
>
>--
>2.26.3
>
>
