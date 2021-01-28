From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Jan 2021 17:45:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/x265: add X265_CPE_ID_VENDOR
In-Reply-To: <20210126205433.2497004-1-fontaine.fabrice@gmail.com>
References: <20210126205433.2497004-1-fontaine.fabrice@gmail.com>
Message-ID: <20210128164528.GP2325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-01-26 21:54 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:multicorewareinc:x265 is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amulticorewareinc%3Ax265
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/x265/x265.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/x265/x265.mk b/package/x265/x265.mk
> index ae9e0acb64..872753eea8 100644
> --- a/package/x265/x265.mk
> +++ b/package/x265/x265.mk
> @@ -9,6 +9,7 @@ X265_SOURCE = x265_$(X265_VERSION).tar.gz
>  X265_SITE = https://bitbucket.org/multicoreware/x265/downloads
>  X265_LICENSE = GPL-2.0+
>  X265_LICENSE_FILES = COPYING
> +X265_CPE_ID_VENDOR = multicorewareinc
>  X265_SUBDIR = source
>  X265_INSTALL_STAGING = YES
>  X265_MAKE = $(MAKE1)
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
