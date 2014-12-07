From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Dec 2014 00:21:19 +0100
Subject: [Buildroot] [PATCH 37/51] xbmc-addon-xvdr: Change comments on
 VERSION
In-Reply-To: <1414349157-22749-37-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1414349157-22749-37-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141207232118.GO10809@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2014-10-26 19:45 +0100, Maxime Hadjinlian spake thusly:
> The cset points actually to HEAD of the Gotham branch, change the
> comment to reflect that.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk b/package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk
> index a4d9624..d51d2c5 100644
> --- a/package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk
> +++ b/package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk
> @@ -4,9 +4,8 @@
>  #
>  ################################################################################
>  
> -# This cset is on master. When a Gotham branch is made, we should
> -# follow it, as incompatible changes in the plugins API can happen
> -# on the master branch.
> +# This cset is the HEAD of the xbmc-gotham master. It will need to change when
> +# XBMC is updated.
>  XBMC_ADDON_XVDR_VERSION = 82b5093ad33847f97a978cb620c9a87d2dbcf7eb
>  XBMC_ADDON_XVDR_SITE = $(call github,pipelka,xbmc-addon-xvdr,$(XBMC_ADDON_XVDR_VERSION))
>  XBMC_ADDON_XVDR_LICENSE = GPLv2+
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
