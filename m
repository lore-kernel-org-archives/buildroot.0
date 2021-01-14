From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Jan 2021 23:35:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/tcpreplay: add
 TCPREPLAY_CPE_ID_VENDOR
In-Reply-To: <20210111224008.1419274-1-fontaine.fabrice@gmail.com>
References: <20210111224008.1419274-1-fontaine.fabrice@gmail.com>
Message-ID: <20210114233517.5d34cc86@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 11 Jan 2021 23:40:08 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:tcpreplay:tcpreplay is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atcpreplay%3Atcpreplay
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/tcpreplay/tcpreplay.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
> index 8b395b4962..1a1da73337 100644
> --- a/package/tcpreplay/tcpreplay.mk
> +++ b/package/tcpreplay/tcpreplay.mk
> @@ -9,6 +9,7 @@ TCPREPLAY_SITE = https://github.com/appneta/tcpreplay/releases/download/v$(TCPRE
>  TCPREPLAY_SOURCE = tcpreplay-$(TCPREPLAY_VERSION).tar.xz
>  TCPREPLAY_LICENSE = GPL-3.0
>  TCPREPLAY_LICENSE_FILES = docs/LICENSE
> +TCPREPLAY_CPE_ID_VENDOR = $(TCPREPLAY_NAME)

Changed to use tcpreplay directly.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
