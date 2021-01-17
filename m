From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 17:22:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/tinc: add TINC_CPE_ID_VENDOR
In-Reply-To: <20210117161931.352420-1-fontaine.fabrice@gmail.com>
References: <20210117161931.352420-1-fontaine.fabrice@gmail.com>
Message-ID: <20210117162205.GU2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-01-17 17:19 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:tinc-vpn:tinc is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atinc-vpn%3Atinc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

With boinc, applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/tinc/tinc.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/tinc/tinc.mk b/package/tinc/tinc.mk
> index 56a26e9a55..0726e81d52 100644
> --- a/package/tinc/tinc.mk
> +++ b/package/tinc/tinc.mk
> @@ -9,6 +9,7 @@ TINC_SITE = http://www.tinc-vpn.org/packages
>  TINC_DEPENDENCIES = lzo openssl zlib
>  TINC_LICENSE = GPL-2.0+ with OpenSSL exception
>  TINC_LICENSE_FILES = COPYING COPYING.README
> +TINC_CPE_ID_VENDOR = tinc-vpn
>  TINC_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=c99"
>  
>  ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
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
