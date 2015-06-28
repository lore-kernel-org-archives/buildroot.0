From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Jun 2015 14:49:27 +0200
Subject: [Buildroot] [PATCH 4/4] package/kodi/kodi: Remove hyperflous
 option --disable-dvdcss
In-Reply-To: <1434273033-31723-4-git-send-email-bernd.kuhls@t-online.de>
References: <1434273033-31723-1-git-send-email-bernd.kuhls@t-online.de>
 <1434273033-31723-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150628124927.GB3950@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-06-14 11:10 +0200, Bernd Kuhls spake thusly:
> The option is controlled later on inside this if-clause
> 
> ifeq ($(BR2_PACKAGE_KODI_OPTICALDRIVE),y)
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi/kodi/kodi.mk |    1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/kodi/kodi/kodi.mk b/package/kodi/kodi/kodi.mk
> index cecc41f..2b21e1f 100644
> --- a/package/kodi/kodi/kodi.mk
> +++ b/package/kodi/kodi/kodi.mk

This is not the correct layout we currently have in master.

Otherwise:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

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
