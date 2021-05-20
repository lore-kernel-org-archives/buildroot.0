From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 May 2021 21:44:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/poco: add POCO_CPE_ID_VENDOR
In-Reply-To: <20210520184808.181550-1-fontaine.fabrice@gmail.com>
References: <20210520184808.181550-1-fontaine.fabrice@gmail.com>
Message-ID: <20210520194451.GB3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-20 20:48 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:pocoproject:poco is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apocoproject%3Apoco
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/poco/poco.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/poco/poco.mk b/package/poco/poco.mk
> index c605044ba3..857f215e3a 100644
> --- a/package/poco/poco.mk
> +++ b/package/poco/poco.mk
> @@ -8,6 +8,7 @@ POCO_VERSION = 1.10.1
>  POCO_SITE = $(call github,pocoproject,poco,poco-$(POCO_VERSION)-release)
>  POCO_LICENSE = BSL-1.0
>  POCO_LICENSE_FILES = LICENSE
> +POCO_CPE_ID_VENDOR = pocoproject
>  POCO_INSTALL_STAGING = YES
>  
>  POCO_DEPENDENCIES = zlib pcre \
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
