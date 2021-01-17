From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 17:20:02 +0100
Subject: [Buildroot] [PATCH] package/libyang: add LIBYANG_CPE_ID_VENDOR
In-Reply-To: <20210117143329.27231-2-heiko.thiery@gmail.com>
References: <20210117143329.27231-1-heiko.thiery@gmail.com>
 <20210117143329.27231-2-heiko.thiery@gmail.com>
Message-ID: <20210117162002.GT2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2021-01-17 15:33 +0100, Heiko Thiery spake thusly:
> cpe:2.3:a:cesnet:libyang is a valid CPE identifier for this package:
> 
> https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=libyang
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libyang/libyang.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
> index 779c440e27..b4b82a9df7 100644
> --- a/package/libyang/libyang.mk
> +++ b/package/libyang/libyang.mk
> @@ -9,6 +9,7 @@ LIBYANG_SITE = $(call github,CESNET,libyang,v$(LIBYANG_VERSION))
>  LIBYANG_LICENSE = BSD-3-Clause
>  LIBYANG_LICENSE_FILES = LICENSE
>  LIBYANG_INSTALL_STAGING = YES
> +LIBYANG_CPE_ID_VENDOR = cesnet
>  LIBYANG_SUPPORTS_IN_SOURCE_BUILD = NO
>  LIBYANG_DEPENDENCIES = pcre
>  HOST_LIBYANG_DEPENDENCIES = host-pcre
> -- 
> 2.20.1
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
