From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Jan 2021 17:55:23 +0100
Subject: [Buildroot] [PATCH 1/2] package/socat: add SOCAT_CPE_ID_VENDOR
In-Reply-To: <20210127214456.3402995-1-fontaine.fabrice@gmail.com>
References: <20210127214456.3402995-1-fontaine.fabrice@gmail.com>
Message-ID: <20210128165523.GR2325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-01-27 22:44 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:dest-unreach:socat is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Adest-unreach%3Asocat
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/socat/socat.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/socat/socat.mk b/package/socat/socat.mk
> index 4bfdc18f91..aedc21c3e3 100644
> --- a/package/socat/socat.mk
> +++ b/package/socat/socat.mk
> @@ -9,6 +9,7 @@ SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
>  SOCAT_SITE = http://www.dest-unreach.org/socat/download
>  SOCAT_LICENSE = GPL-2.0 with OpenSSL exception
>  SOCAT_LICENSE_FILES = README COPYING COPYING.OpenSSL
> +SOCAT_CPE_ID_VENDOR = dest-unreach
>  
>  ifeq ($(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),y)
>  SOCAT_CONF_ENV += \
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
