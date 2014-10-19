From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Oct 2014 10:57:28 +0200
Subject: [Buildroot] [PATCH] xbmc: use github call
In-Reply-To: <1413138060-1146-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1413138060-1146-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141019085728.GF4072@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2014-10-12 20:21 +0200, Maxime Hadjinlian spake thusly:
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/xbmc/xbmc.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
> index 0101ad7..966dbb3 100644
> --- a/package/xbmc/xbmc.mk
> +++ b/package/xbmc/xbmc.mk
> @@ -5,8 +5,7 @@
>  ################################################################################
>  
>  XBMC_VERSION = 13.2-Gotham
> -XBMC_SOURCE = $(XBMC_VERSION).tar.gz
> -XBMC_SITE = https://github.com/xbmc/xbmc/archive
> +XBMC_SITE = $(call github,xbmc,xbmc,$(XBMC_VERSION))
>  XBMC_LICENSE = GPLv2
>  XBMC_LICENSE_FILES = LICENSE.GPL
>  # XBMC needs host-sdl_image (and therefore host-sdl) for a host tools it builds
> -- 
> 2.1.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
