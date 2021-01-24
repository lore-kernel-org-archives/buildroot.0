From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2021 17:26:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/mbedtls: add CPE variables
In-Reply-To: <20210123231354.321220-1-fontaine.fabrice@gmail.com>
References: <20210123231354.321220-1-fontaine.fabrice@gmail.com>
Message-ID: <20210124162650.GG2325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-01-24 00:13 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:arm:mbed_tls is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aarm%3Ambed_tls
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mbedtls/mbedtls.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
> index 77373d8b34..9e3e9f626d 100644
> --- a/package/mbedtls/mbedtls.mk
> +++ b/package/mbedtls/mbedtls.mk
> @@ -12,6 +12,8 @@ MBEDTLS_CONF_OPTS = \
>  MBEDTLS_INSTALL_STAGING = YES
>  MBEDTLS_LICENSE = Apache-2.0
>  MBEDTLS_LICENSE_FILES = apache-2.0.txt
> +MBEDTLS_CPE_ID_VENDOR = arm
> +MBEDTLS_CPE_ID_PRODUCT = mbed_tls
>  
>  # This is mandatory for hiawatha
>  ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
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
