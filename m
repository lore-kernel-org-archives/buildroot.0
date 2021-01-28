From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Jan 2021 17:55:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/webp: add CPE variables
In-Reply-To: <20210126213656.2498739-1-fontaine.fabrice@gmail.com>
References: <20210126213656.2498739-1-fontaine.fabrice@gmail.com>
Message-ID: <20210128165548.GS2325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-01-26 22:36 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:webmproject:libwebp is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awebmproject%3Alibwebp
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/webp/webp.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/webp/webp.mk b/package/webp/webp.mk
> index 4a94554984..5047965894 100644
> --- a/package/webp/webp.mk
> +++ b/package/webp/webp.mk
> @@ -9,6 +9,8 @@ WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
>  WEBP_SITE = http://downloads.webmproject.org/releases/webp
>  WEBP_LICENSE = BSD-3-Clause
>  WEBP_LICENSE_FILES = COPYING
> +WEBP_CPE_ID_VENDOR = webmproject
> +WEBP_CPE_ID_PRODUCT = libwebp
>  WEBP_INSTALL_STAGING = YES
>  
>  WEBP_CONF_OPTS += \
> -- 
> 2.29.2
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
