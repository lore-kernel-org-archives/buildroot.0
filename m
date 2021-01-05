From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 5 Jan 2021 12:27:28 +0100
Subject: [Buildroot] [PATCH 2/8] package/freescale-imx/imx-sc-firmware:
 bump version to 1.7.0
In-Reply-To: <20210104173820.6720-3-stephane.viau@oss.nxp.com>
References: <20210104173820.6720-1-stephane.viau@oss.nxp.com>
 <20210104173820.6720-3-stephane.viau@oss.nxp.com>
Message-ID: <X/RNID/oXcHGRTw9@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stephane,

On Mon, Jan 04, 2021 at 06:38:14PM +0100, Stephane Viau wrote:
> This version is aligned with 5.4.70_2.3.0 NXP Linux BSP.
> 
> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
> ---
>  package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash | 6 +++---
>  package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
> index 630ccc842d..661a77de1a 100644
> --- a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
> +++ b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256  d3b04a49bcfdb5c7aa7e8f5ff89c040e9dfde0e8cb4b22bfb31f9cbb22a9d310  imx-sc-firmware-1.6.0.bin
> -sha256  a39da2e94bd8b99eaac4325633854620ea3a55145259c3a7748c610a80714cfc  EULA
> -sha256  69cbb76b3f10ac5a8c36f34df7bbdf50825815560c00a946fff2922365ef01a2  COPYING
> +sha256  db4c414d405aea6f013946d109db198798f40f71bf0810b9b50c027ca252b4b7  imx-sc-firmware-1.7.0.bin
> +sha256  72edc2072c86d93aa1993d15d4d19d96270af3749b0108995ad50c81d1461f52  EULA
> +sha256  9c16421e7c702f56756650b8ac954d34556327e598a8666e6e8f4eb3a1aa95f1  COPYING
> diff --git a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
> index dab6130d3d..b05ca3c724 100644
> --- a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
> +++ b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -IMX_SC_FIRMWARE_VERSION = 1.6.0
> +IMX_SC_FIRMWARE_VERSION = 1.7.0
>  IMX_SC_FIRMWARE_SITE = $(FREESCALE_IMX_SITE)
>  IMX_SC_FIRMWARE_SOURCE = imx-sc-firmware-$(IMX_SC_FIRMWARE_VERSION).bin

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Thanks,
Gary
