From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Wed, 27 Jan 2021 19:04:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/wine: add WINE_CPE_ID_VENDOR
In-Reply-To: <20210126211539.2497979-1-fontaine.fabrice@gmail.com>
References: <20210126211539.2497979-1-fontaine.fabrice@gmail.com>
Message-ID: <a40e2500-88c6-2f12-928f-3a4945f38f27@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 26.01.21 um 22:15 schrieb Fabrice Fontaine:
> cpe:2.3:a:winehq:wine is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awinehq%3Awine
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/wine/wine.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/wine/wine.mk b/package/wine/wine.mk
> index 7eafe9b06d..80c9d20d3d 100644
> --- a/package/wine/wine.mk
> +++ b/package/wine/wine.mk
> @@ -9,6 +9,7 @@ WINE_SOURCE = wine-$(WINE_VERSION).tar.xz
>  WINE_SITE = https://dl.winehq.org/wine/source/5.x
>  WINE_LICENSE = LGPL-2.1+
>  WINE_LICENSE_FILES = COPYING.LIB LICENSE
> +WINE_CPE_ID_VENDOR = winehq
>  WINE_DEPENDENCIES = host-bison host-flex host-wine
>  HOST_WINE_DEPENDENCIES = host-bison host-flex
>  
> 

Acked-by: Andr? Hentschel <nerv@dawncrow.de>
