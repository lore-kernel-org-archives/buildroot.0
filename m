From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Oct 2014 17:11:42 -0700
Subject: [Buildroot] [PATCH] luaposix: Use github call
In-Reply-To: <1413131033-26185-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1413131033-26185-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141025001141.GG14818@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2014-10-12 18:23 +0200, Maxime Hadjinlian spake thusly:
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/luaposix/luaposix.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
> index 46723a0..13fc266 100644
> --- a/package/luaposix/luaposix.mk
> +++ b/package/luaposix/luaposix.mk
> @@ -5,8 +5,7 @@
>  ################################################################################
>  
>  LUAPOSIX_VERSION = 32
> -LUAPOSIX_SITE = https://github.com/luaposix/luaposix/archive
> -LUAPOSIX_SOURCE = release-v$(LUAPOSIX_VERSION).tar.gz
> +LUAPOSIX_SITE = $(call github,luaposix,luaposix,release-v$(LUAPOSIX_VERSION))
>  LUAPOSIX_LICENSE = MIT
>  LUAPOSIX_LICENSE_FILES = COPYING
>  LUAPOSIX_DEPENDENCIES = luainterpreter host-lua
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
