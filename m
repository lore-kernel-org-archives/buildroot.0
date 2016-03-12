From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Mar 2016 23:40:07 +0100
Subject: [Buildroot] [PATCH] screen: re-eneable parallel builds
In-Reply-To: <1457719646-28009-1-git-send-email-gustavo@zacarias.com.ar>
References: <1457719646-28009-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160312224007.GF3745@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2016-03-11 15:07 -0300, Gustavo Zacarias spake thusly:
> They don't seem to be causing any issues after many bumps and tests.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/screen/screen.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/screen/screen.mk b/package/screen/screen.mk
> index 45689d3..0316e3d 100644
> --- a/package/screen/screen.mk
> +++ b/package/screen/screen.mk
> @@ -11,7 +11,6 @@ SCREEN_LICENSE_FILES = COPYING
>  SCREEN_DEPENDENCIES = ncurses
>  SCREEN_AUTORECONF = YES
>  SCREEN_CONF_ENV = CFLAGS="$(TARGET_CFLAGS)"
> -SCREEN_MAKE = $(MAKE1)
>  SCREEN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) SCREEN=screen install_bin
>  
>  define SCREEN_INSTALL_SCREENRC
> -- 
> 2.4.10
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
