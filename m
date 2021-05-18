From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 18:54:49 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/kodi-inputstream-adaptive:
 bump version to 2.6.15-Matrix
In-Reply-To: <20210518153832.105159-1-bernd.kuhls@t-online.de>
References: <20210518153832.105159-1-bernd.kuhls@t-online.de>
Message-ID: <20210518165449.GV2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2021-05-18 17:38 +0200, Bernd Kuhls spake thusly:
> Changelog:
> https://github.com/xbmc/inputstream.adaptive/blob/Matrix/inputstream.adaptive/addon.xml.in#L22
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash    | 2 +-
>  package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
> index 2626968f1b..12e9f20904 100644
> --- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
> +++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  f1756932e8cc602ce66c5db3bc1d44a442c01197c193561ca9248a405bd8bd86  kodi-inputstream-adaptive-2.6.14-Matrix.tar.gz
> +sha256  179b337c397ff484f25a936f8c50114a112d5107f6d3cf41b4e9fb92507525fd  kodi-inputstream-adaptive-2.6.15-Matrix.tar.gz
>  sha256  89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.GPL
> diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
> index b72241ab39..6176d7bff0 100644
> --- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
> +++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KODI_INPUTSTREAM_ADAPTIVE_VERSION = 2.6.14-Matrix
> +KODI_INPUTSTREAM_ADAPTIVE_VERSION = 2.6.15-Matrix
>  KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
>  KODI_INPUTSTREAM_ADAPTIVE_LICENSE = GPL-2.0+
>  KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = LICENSE.GPL
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
