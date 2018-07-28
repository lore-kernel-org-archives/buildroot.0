From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 28 Jul 2018 23:53:44 +0200
Subject: [Buildroot] [PATCH 1/8] firmware-imx: bump to version 7.5
In-Reply-To: <20180725150149.30774-2-gary.bisson@boundarydevices.com>
References: <20180725150149.30774-1-gary.bisson@boundarydevices.com>
 <20180725150149.30774-2-gary.bisson@boundarydevices.com>
Message-ID: <6f639664-4b81-033c-fa68-44d48e0a347f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-07-18 17:01, Gary Bisson wrote:
> This new package includes new binaries for i.MX8QXP.
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

 I've applied this patch to master, the rest is changes requested.

 Regards,
 Arnout

> ---
>  package/freescale-imx/firmware-imx/firmware-imx.hash | 2 +-
>  package/freescale-imx/firmware-imx/firmware-imx.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
> index dd0e13a7cf..c4930bb67d 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.hash
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256 8a8ec439d014e928f42c49bab1c382914ec5b4f1041df28e5d687eb194bd07ab  firmware-imx-7.4.bin
> +sha256 a8f099bdf786b2da1e8b43094950c033ccdbf93f1b8a93caffb912e1500cd735  firmware-imx-7.5.bin
>  sha256 faf01d10e484879247963eb97d96622a980232e22a35e487dfe53b13708b686a  EULA
>  sha256 0f34f6175247762e2e1c38319aadf657a53f00ce124e569dfc61b30451549e7a  COPYING
> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
> index b9756fc2bf..0a503d7a66 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.mk
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FIRMWARE_IMX_VERSION = 7.4
> +FIRMWARE_IMX_VERSION = 7.5
>  FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
>  FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
