From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Apr 2021 21:30:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/fmt: add FMT_CPE_ID_VENDOR
In-Reply-To: <20210418183847.2981328-1-fontaine.fabrice@gmail.com>
References: <20210418183847.2981328-1-fontaine.fabrice@gmail.com>
Message-ID: <20210420193038.GB298901@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-04-18 20:38 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:fmt:fmt is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afmt%3Afmt
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/fmt/fmt.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/fmt/fmt.mk b/package/fmt/fmt.mk
> index 000bacfd7b..7ea7b9d69c 100644
> --- a/package/fmt/fmt.mk
> +++ b/package/fmt/fmt.mk
> @@ -9,6 +9,7 @@ FMT_SITE = https://github.com/fmtlib/fmt/releases/download/$(FMT_VERSION)
>  FMT_SOURCE = fmt-$(FMT_VERSION).zip
>  FMT_LICENSE = MIT with exception
>  FMT_LICENSE_FILES = LICENSE.rst
> +FMT_CPE_ID_VENDOR  = fmt
>  FMT_INSTALL_STAGING = YES
>  
>  FMT_CONF_OPTS = \
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
