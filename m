From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 May 2021 18:45:16 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/kodi-pvr-iptvsimple: bump
 version to 7.6.5-Matrix
In-Reply-To: <20210516131949.1889386-1-bernd.kuhls@t-online.de>
References: <20210516131949.1889386-1-bernd.kuhls@t-online.de>
Message-ID: <20210516164516.GN2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2021-05-16 15:19 +0200, Bernd Kuhls spake thusly:
> Changelog:
> https://github.com/kodi-pvr/pvr.iptvsimple/blob/Matrix/pvr.iptvsimple/changelog.txt
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash | 2 +-
>  package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
> index f467c7d40b..495565ef46 100644
> --- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
> +++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  1310806ac4fd8c6e72020042e62bde8c9175e65015c4fddb82312cf32c53bf63  kodi-pvr-iptvsimple-7.6.4-Matrix.tar.gz
> +sha256  2b46ab509e26fb4a60759e78f9f13808f5bb2c67a03a62c58ebcadb31c26e6e1  kodi-pvr-iptvsimple-7.6.5-Matrix.tar.gz
>  sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
> diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
> index 60e51a038b..03b96a1a7d 100644
> --- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
> +++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KODI_PVR_IPTVSIMPLE_VERSION = 7.6.4-Matrix
> +KODI_PVR_IPTVSIMPLE_VERSION = 7.6.5-Matrix
>  KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
>  KODI_PVR_IPTVSIMPLE_LICENSE = GPL-2.0+
>  KODI_PVR_IPTVSIMPLE_LICENSE_FILES = LICENSE.md
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
