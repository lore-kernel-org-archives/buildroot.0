From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 May 2021 13:45:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/php-imagick: add CPE variables
In-Reply-To: <20210523211348.1532716-1-fontaine.fabrice@gmail.com>
References: <20210523211348.1532716-1-fontaine.fabrice@gmail.com>
Message-ID: <20210524114553.GO3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, all,

On 2021-05-23 23:13 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:php:imagick is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aphp%3Aimagick
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/php-imagick/php-imagick.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/php-imagick/php-imagick.mk b/package/php-imagick/php-imagick.mk
> index ca0cbc7492..6fb43de0ca 100644
> --- a/package/php-imagick/php-imagick.mk
> +++ b/package/php-imagick/php-imagick.mk
> @@ -13,6 +13,8 @@ PHP_IMAGICK_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
>  PHP_IMAGICK_DEPENDENCIES = imagemagick php host-autoconf
>  PHP_IMAGICK_LICENSE = PHP-3.01
>  PHP_IMAGICK_LICENSE_FILES = LICENSE
> +PHP_IMAGICK_CPE_ID_VENDOR = php
> +PHP_IMAGICK_CPE_ID_PRODUCT = imagick
>  
>  define PHP_IMAGICK_PHPIZE
>  	(cd $(@D); \
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
