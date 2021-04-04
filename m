From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Apr 2021 18:32:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvips: add
 LIBVIPS_CPE_ID_VENDOR
In-Reply-To: <20210404160652.2898792-1-fontaine.fabrice@gmail.com>
References: <20210404160652.2898792-1-fontaine.fabrice@gmail.com>
Message-ID: <20210404163222.GK2252@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-04-04 18:06 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:libvips_project:libvips is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibvips_project%3Alibvips
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libvips/libvips.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libvips/libvips.mk b/package/libvips/libvips.mk
> index 82c1adeb21..f7b15e8e06 100644
> --- a/package/libvips/libvips.mk
> +++ b/package/libvips/libvips.mk
> @@ -9,6 +9,7 @@ LIBVIPS_SOURCE = vips-$(LIBVIPS_VERSION).tar.gz
>  LIBVIPS_SITE = https://github.com/libvips/libvips/releases/download/v$(LIBVIPS_VERSION)
>  LIBVIPS_LICENSE = LGPL-2.1+
>  LIBVIPS_LICENSE_FILES = COPYING
> +LIBVIPS_CPE_ID_VENDOR = libvips_project
>  
>  # Sparc64 compile fails, for all optimization levels except -O0. To
>  # fix the problem, use -O0 with no optimization instead. Bug reported
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
