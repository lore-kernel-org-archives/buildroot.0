From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 May 2021 21:45:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/libeXosip2: add CPE variables
In-Reply-To: <20210520191534.182725-1-fontaine.fabrice@gmail.com>
References: <20210520191534.182725-1-fontaine.fabrice@gmail.com>
Message-ID: <20210520194524.GD3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-20 21:15 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:gnu:exosip is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Aexosip
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libeXosip2/libeXosip2.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
> index dba2b63a02..3ed637a3d4 100644
> --- a/package/libeXosip2/libeXosip2.mk
> +++ b/package/libeXosip2/libeXosip2.mk
> @@ -11,6 +11,8 @@ LIBEXOSIP2_SITE = http://download.savannah.gnu.org/releases/exosip
>  LIBEXOSIP2_INSTALL_STAGING = YES
>  LIBEXOSIP2_LICENSE = GPL-2.0+
>  LIBEXOSIP2_LICENSE_FILES = COPYING
> +LIBEXOSIP2_CPE_ID_VENDOR = gnu
> +LIBEXOSIP2_CPE_ID_PRODUCT = exosip
>  
>  LIBEXOSIP2_DEPENDENCIES = host-pkgconf libosip2
>  
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
