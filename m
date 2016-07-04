From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Jul 2016 17:56:17 +0200
Subject: [Buildroot] [PATCH 4/6] iw: correct license name
In-Reply-To: <1467636386-6759-4-git-send-email-rahul.bedarkar@imgtec.com>
References: <1467636386-6759-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1467636386-6759-4-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160704155617.GD3549@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rahul, All,

On 2016-07-04 18:16 +0530, Rahul Bedarkar spake thusly:
> iw license is ISC.
> 
> Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/iw/iw.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/iw/iw.mk b/package/iw/iw.mk
> index 200e703..6f3f309 100644
> --- a/package/iw/iw.mk
> +++ b/package/iw/iw.mk
> @@ -7,7 +7,7 @@
>  IW_VERSION = 4.7
>  IW_SOURCE = iw-$(IW_VERSION).tar.xz
>  IW_SITE = $(BR2_KERNEL_MIRROR)/software/network/iw
> -IW_LICENSE = iw license
> +IW_LICENSE = ISC
>  IW_LICENSE_FILES = COPYING
>  IW_DEPENDENCIES = host-pkgconf libnl
>  IW_MAKE_OPTS = CC="$(TARGET_CC)" LD="$(TARGET_LD)" LDFLAGS="$(TARGET_LDFLAGS)"
> -- 
> 2.6.2
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
