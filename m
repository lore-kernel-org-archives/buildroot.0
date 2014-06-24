From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 24 Jun 2014 23:55:09 +0200
Subject: [Buildroot] [PATCH 09/54] libgail: add license information
In-Reply-To: <1403636160-11807-9-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
 <1403636160-11807-9-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140624215509.GI31767@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-06-24 15:55 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

COPYING is LGPLv2; files refer to LGPLv2+.

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libgail/libgail.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libgail/libgail.mk b/package/libgail/libgail.mk
> index 3034b41..02b2735 100644
> --- a/package/libgail/libgail.mk
> +++ b/package/libgail/libgail.mk
> @@ -10,6 +10,8 @@ LIBGAIL_SOURCE = gail-$(LIBGAIL_VERSION).tar.bz2
>  LIBGAIL_SITE = http://ftp.gnome.org/pub/gnome/sources/gail/$(LIBGAIL_VERSION_MAJOR)
>  LIBGAIL_AUTORECONF = YES
>  LIBGAIL_INSTALL_STAGING = YES
> +LIBGAIL_LICENSE = LGPLv2+
> +LIBGAIL_LICENSE_FILES = COPYING
>  
>  ifneq ($(BR2_PACKAGE_XLIB_LIBX11),y)
>  LIBGAIL_CONF_OPT += --disable-x
> -- 
> 1.8.5.5
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
