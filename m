From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 6 Aug 2014 19:25:31 +0200
Subject: [Buildroot] [PATCH v2 2/3] rpi-userland: .mk: Indent rules with
 tabs
In-Reply-To: <1407332350-27220-2-git-send-email-benoit.thebaudeau@advansee.com>
References: <1407332350-27220-1-git-send-email-benoit.thebaudeau@advansee.com>
 <1407332350-27220-2-git-send-email-benoit.thebaudeau@advansee.com>
Message-ID: <20140806172531.GE3891@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Benoit, All,

On 2014-08-06 15:39 +0200, Beno?t Th?baudeau spake thusly:
> Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> 
> Changes in v2: New patch
> ---
>  package/rpi-userland/rpi-userland.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
> index 20f68fa..81ed95c 100644
> --- a/package/rpi-userland/rpi-userland.mk
> +++ b/package/rpi-userland/rpi-userland.mk
> @@ -14,7 +14,7 @@ RPI_USERLAND_CONF_OPT = -DVMCS_INSTALL_PREFIX=/usr
>  RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg
>  
>  define RPI_USERLAND_POST_TARGET_CLEANUP
> -    rm -Rf $(TARGET_DIR)/usr/src
> +	rm -Rf $(TARGET_DIR)/usr/src
>  endef
>  RPI_USERLAND_POST_INSTALL_TARGET_HOOKS += RPI_USERLAND_POST_TARGET_CLEANUP
>  
> -- 
> 1.9.1
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
