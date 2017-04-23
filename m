From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Apr 2017 11:05:57 +0200
Subject: [Buildroot] [PATCH v5 19/34] package/kodi-pvr-mythtv: bump
 version to 4.15.0
In-Reply-To: <20170417195433.26672-20-bernd.kuhls@t-online.de>
References: <20170417195433.26672-1-bernd.kuhls@t-online.de>
 <20170417195433.26672-20-bernd.kuhls@t-online.de>
Message-ID: <20170423090557.GL2819@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-04-17 21:54 +0200, Bernd Kuhls spake thusly:
> Upstream repo was changed:
> https://github.com/xbmc/repo-binary-addons/commit/cf93c8be639a3122db3ecb11c0b42d76e2e1da98
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Version bump, should be right after the Kodi version bump.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash | 2 +-
>  package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk   | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
> index 0e9eba87e..57725a0ed 100644
> --- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
> +++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256 f6d61b134a96a25820b616e60e43ac1ed33bd3f8b9f7612a6f6324356b78582d kodi-pvr-mythtv-84b0b6b122ca779588de5c895ef77b6bc454e859.tar.gz
> +sha256 30b6a20f846f0f0cc14c2347efbf3b72162c876daed53a3731d3f975d370765e  kodi-pvr-mythtv-4.15.0.tar.gz
> diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
> index 2c5d07a64..515050b17 100644
> --- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
> +++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -# This cset is on the branch 'Jarvis'
> +# This cset is on the branch 'Krypton'
>  # When Kodi is updated, then this should be updated to the corresponding branch
> -KODI_PVR_MYTHTV_VERSION = 84b0b6b122ca779588de5c895ef77b6bc454e859
> -KODI_PVR_MYTHTV_SITE = $(call github,kodi-pvr,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
> +KODI_PVR_MYTHTV_VERSION = 4.15.0
> +KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
>  KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
>  KODI_PVR_MYTHTV_LICENSE_FILES = src/client.h
>  KODI_PVR_MYTHTV_DEPENDENCIES = kodi-platform
> -- 
> 2.11.0
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
