From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 2 Jul 2015 21:56:28 +0200
Subject: [Buildroot] [PATCH 1/1 v2] package/kodi: Remove hyperflous
 option --disable-dvdcss
In-Reply-To: <1435863053-23943-1-git-send-email-bernd.kuhls@t-online.de>
References: <1435863053-23943-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150702195628.GB3838@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, all,

On 2015-07-02 20:50 +0200, Bernd Kuhls spake thusly:
> The option is controlled later on inside this if-clause
> 
> ifeq ($(BR2_PACKAGE_KODI_OPTICALDRIVE),y)
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v2: Rebased local repo against upstream (Yann)
> 
>  package/kodi/kodi.mk |    1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index 28fece7..cc42df4 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -34,7 +34,6 @@ KODI_CONF_ENV = \
>  KODI_CONF_OPTS +=  \
>  	--with-ffmpeg=shared \
>  	--disable-crystalhd \
> -	--disable-dvdcss \
>  	--disable-hal \
>  	--disable-joystick \
>  	--disable-openmax \
> -- 
> 1.7.10.4
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
