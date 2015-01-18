From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jan 2015 14:59:54 +0100
Subject: [Buildroot] [PATCH 1/4] package/kodi-audioencoder-flac: bump
 version
In-Reply-To: <1421583404-25251-1-git-send-email-bernd.kuhls@t-online.de>
References: <1421583404-25251-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150118135954.GB4275@free.fr>
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
>  package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
> index a200150..c5115c4 100644
> --- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
> +++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KODI_AUDIOENCODER_FLAC_VERSION = a960ebae64f4b66f580e70318fe6da97771cacba
> +KODI_AUDIOENCODER_FLAC_VERSION = 62c2cc876b572dd8fd9b85d708f86ec9a9d2ffc7
>  KODI_AUDIOENCODER_FLAC_SITE = $(call github,xbmc,audioencoder.flac,$(KODI_AUDIOENCODER_FLAC_VERSION))
>  KODI_AUDIOENCODER_FLAC_LICENSE = GPLv2+
>  KODI_AUDIOENCODER_FLAC_LICENSE_FILES = src/EncoderFlac.cpp
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
