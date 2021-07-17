From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Jul 2021 16:10:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/feh: add FEH_CPE_ID_VENDOR
In-Reply-To: <20210717140513.996425-1-fontaine.fabrice@gmail.com>
References: <20210717140513.996425-1-fontaine.fabrice@gmail.com>
Message-ID: <20210717141001.GT12203@scaer>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fabrice, All,

On 2021-07-17 16:05 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:feh_project:feh is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afeh_project%3Afeh
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/feh/feh.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/feh/feh.mk b/package/feh/feh.mk
> index df59e67d52..f27509330d 100644
> --- a/package/feh/feh.mk
> +++ b/package/feh/feh.mk
> @@ -10,6 +10,7 @@ FEH_SITE = http://feh.finalrewind.org
>  FEH_DEPENDENCIES = imlib2 libpng xlib_libXt
>  FEH_LICENSE = MIT
>  FEH_LICENSE_FILES = COPYING
> +FEH_CPE_ID_VENDOR = feh_project
>  
>  ifeq ($(BR2_PACKAGE_LIBCURL),y)
>  FEH_DEPENDENCIES += libcurl
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
