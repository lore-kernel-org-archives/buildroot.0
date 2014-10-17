From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Oct 2014 00:33:58 +0200
Subject: [Buildroot] [PATCH] libshout: fix typo
In-Reply-To: <1413557524-28370-1-git-send-email-jezz@sysmic.org>
References: <1413557524-28370-1-git-send-email-jezz@sysmic.org>
Message-ID: <20141017223358.GB7944@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2014-10-17 16:52 +0200, J?r?me Pouiller spake thusly:
> Fix error:
>   package/libshout/libshout.mk:28: *** Package error: use LIBSHOUT_CONF_OPTS instead of LIBSHOUT_CONF_OPT. Please fix your .mk file.  Stop.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libshout/libshout.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libshout/libshout.mk b/package/libshout/libshout.mk
> index 1166f58..faee3eb 100644
> --- a/package/libshout/libshout.mk
> +++ b/package/libshout/libshout.mk
> @@ -19,7 +19,7 @@ LIBSHOUT_CONF_OPTS += --disable-theora
>  endif
>  
>  ifeq ($(BR2_PACKAGE_SPEEX),y)
> -LIBSHOUT_CONF_OPT += --enable-speex
> +LIBSHOUT_CONF_OPTS += --enable-speex
>  LIBSHOUT_DEPENDENCIES += speex
>  else
>  LIBSHOUT_CONF_OPTS += --disable-speex
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
