From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jan 2015 15:00:24 +0100
Subject: [Buildroot] [PATCH 2/4] package/kodi-audioencoder-vorbis: bump
 version
In-Reply-To: <1421583404-25251-2-git-send-email-bernd.kuhls@t-online.de>
References: <1421583404-25251-1-git-send-email-bernd.kuhls@t-online.de>
 <1421583404-25251-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150118140024.GC4275@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-01-18 13:16 +0100, Bernd Kuhls spake thusly:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
> index f1864e2..1e5523c 100644
> --- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
> +++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KODI_AUDIOENCODER_VORBIS_VERSION = 787d4a048be7fe8191afda8005a209976724dda1
> +KODI_AUDIOENCODER_VORBIS_VERSION = dbf5c62c088283143c7ad530b106f3cc0c9392e9
>  KODI_AUDIOENCODER_VORBIS_SITE = $(call github,xbmc,audioencoder.vorbis,$(KODI_AUDIOENCODER_VORBIS_VERSION))
>  KODI_AUDIOENCODER_VORBIS_LICENSE = GPLv2+
>  KODI_AUDIOENCODER_VORBIS_LICENSE_FILES = src/EncoderVorbis.cpp
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
