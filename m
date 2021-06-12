From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jun 2021 23:16:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/mupdf: add MUPDF_CPE_ID_VENDOR
In-Reply-To: <20210612152003.543086-1-fontaine.fabrice@gmail.com>
References: <20210612152003.543086-1-fontaine.fabrice@gmail.com>
Message-ID: <20210612211623.GD168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-06-12 17:20 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:artifex:mupdf is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aartifex%3Amupdf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mupdf/mupdf.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
> index 5a905f7903..78dacd214c 100644
> --- a/package/mupdf/mupdf.mk
> +++ b/package/mupdf/mupdf.mk
> @@ -10,6 +10,7 @@ MUPDF_SOURCE = mupdf-$(MUPDF_VERSION)-source.tar.gz
>  MUPDF_SITE = https://mupdf.com/downloads/archive
>  MUPDF_LICENSE = AGPL-3.0+
>  MUPDF_LICENSE_FILES = COPYING
> +MUPDF_CPE_ID_VENDOR = artifex
>  MUPDF_INSTALL_STAGING = YES
>  MUPDF_DEPENDENCIES = \
>  	freetype \
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
