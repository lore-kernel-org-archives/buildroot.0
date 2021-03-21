From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Mar 2021 11:32:41 +0100
Subject: [Buildroot] [PATCH 1/2] package/kodi-inputstream-ffmpegdirect:
 bump version to 1.19.3-Matrix
In-Reply-To: <20210321092125.648090-1-bernd.kuhls@t-online.de>
References: <20210321092125.648090-1-bernd.kuhls@t-online.de>
Message-ID: <20210321103240.GE3443324@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2021-03-21 10:21 +0100, Bernd Kuhls spake thusly:
> Changelog:
> https://github.com/xbmc/inputstream.ffmpegdirect/blob/Matrix/inputstream.ffmpegdirect/changelog.txt
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Series of two applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../kodi-inputstream-ffmpegdirect.hash                          | 2 +-
>  .../kodi-inputstream-ffmpegdirect.mk                            | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
> index ccb7291bb8..1eda502305 100644
> --- a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
> +++ b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  952eeaa7af717dd954c940feb2902b51e497cde8822222c1bfa98804ec8665c7  kodi-inputstream-ffmpegdirect-1.19.2-Matrix.tar.gz
> +sha256  63610cef455cf57540a36dd92b1bd2ea38cc6bf6dd1bc94a8e4089d439172e27  kodi-inputstream-ffmpegdirect-1.19.3-Matrix.tar.gz
>  sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
> diff --git a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
> index 80891858cf..5df8f6fbb9 100644
> --- a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
> +++ b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION = 1.19.2-Matrix
> +KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION = 1.19.3-Matrix
>  KODI_INPUTSTREAM_FFMPEGDIRECT_SITE = $(call github,xbmc,inputstream.ffmpegdirect,$(KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION))
>  KODI_INPUTSTREAM_FFMPEGDIRECT_LICENSE = GPL-2.0+
>  KODI_INPUTSTREAM_FFMPEGDIRECT_LICENSE_FILES = LICENSE.md
> -- 
> 2.29.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
