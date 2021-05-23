From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 May 2021 19:59:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/netsurf: add
 NETSURF_CPE_ID_VENDOR
In-Reply-To: <20210523141135.1522549-1-fontaine.fabrice@gmail.com>
References: <20210523141135.1522549-1-fontaine.fabrice@gmail.com>
Message-ID: <20210523175916.GZ3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-23 16:11 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:netsurf-browser:netsurf is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anetsurf-browser%3Anetsurf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/netsurf/netsurf.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
> index 5677b6946c..1064698c12 100644
> --- a/package/netsurf/netsurf.mk
> +++ b/package/netsurf/netsurf.mk
> @@ -9,6 +9,7 @@ NETSURF_SOURCE = netsurf-all-$(NETSURF_VERSION).tar.gz
>  NETSURF_SITE = http://download.netsurf-browser.org/netsurf/releases/source-full
>  NETSURF_LICENSE = GPL-2.0
>  NETSURF_LICENSE_FILES = netsurf/COPYING
> +NETSURF_CPE_ID_VENDOR = netsurf-browser
>  # host-vim needed for the xxd utility
>  NETSURF_DEPENDENCIES = expat jpeg libpng \
>  	host-bison host-flex host-gperf host-pkgconf host-vim
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
