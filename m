From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 May 2021 21:45:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/less: add LESS_CPE_ID_VENDOR
In-Reply-To: <20210520190608.182162-1-fontaine.fabrice@gmail.com>
References: <20210520190608.182162-1-fontaine.fabrice@gmail.com>
Message-ID: <20210520194506.GC3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-20 21:06 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:gnu:less is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Aless
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/less/less.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/less/less.mk b/package/less/less.mk
> index 89962f9529..a15bd25bec 100644
> --- a/package/less/less.mk
> +++ b/package/less/less.mk
> @@ -8,6 +8,7 @@ LESS_VERSION = 563
>  LESS_SITE = http://www.greenwoodsoftware.com/less
>  LESS_LICENSE = GPL-3.0+
>  LESS_LICENSE_FILES = COPYING
> +LESS_CPE_ID_VENDOR = gnu
>  LESS_DEPENDENCIES = ncurses
>  
>  define LESS_INSTALL_TARGET_CMDS
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
