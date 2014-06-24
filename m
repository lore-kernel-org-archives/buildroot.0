From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 24 Jun 2014 23:39:01 +0200
Subject: [Buildroot] [PATCH 05/54] libart: add license information
In-Reply-To: <1403636160-11807-5-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
 <1403636160-11807-5-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140624213901.GD31767@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-06-24 15:55 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

COPYING is LGPLv2; files refer to LGPLv2+

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libart/libart.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libart/libart.mk b/package/libart/libart.mk
> index 39c72cc..a103f23 100644
> --- a/package/libart/libart.mk
> +++ b/package/libart/libart.mk
> @@ -11,5 +11,7 @@ LIBART_SITE = http://ftp.gnome.org/pub/gnome/sources/libart_lgpl/$(LIBART_VERSIO
>  LIBART_AUTORECONF = YES
>  LIBART_INSTALL_STAGING = YES
>  LIBART_CONFIG_SCRIPTS = libart2-config
> +LIBART_LICENSE = LGPLv2+
> +LIBART_LICENSE_FILES = COPYING
>  
>  $(eval $(autotools-package))
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
