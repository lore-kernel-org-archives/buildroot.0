From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 18:54:33 +0200
Subject: [Buildroot] [PATCH/next 1/1]
 package/kodi-pvr-mediaportal-tvserver: bump version to 8.2.0-Matrix
In-Reply-To: <20210518153628.104731-1-bernd.kuhls@t-online.de>
References: <20210518153628.104731-1-bernd.kuhls@t-online.de>
Message-ID: <20210518165433.GU2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2021-05-18 17:36 +0200, Bernd Kuhls spake thusly:
> Changelog:
> https://github.com/kodi-pvr/pvr.mediaportal.tvserver/blob/Matrix/pvr.mediaportal.tvserver/changelog.txt
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../kodi-pvr-mediaportal-tvserver.hash                          | 2 +-
>  .../kodi-pvr-mediaportal-tvserver.mk                            | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
> index 83ac680914..ca526f40a0 100644
> --- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
> +++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  cea87ccdceee834c96d6b6887b78213ccf79890fec97436cbef17c57b9cdac15  kodi-pvr-mediaportal-tvserver-8.1.2-Matrix.tar.gz
> +sha256  0109daa45d7b6450954b40d0b09dbef28818c551e9f0fea9943cfd06f0a7ec40  kodi-pvr-mediaportal-tvserver-8.2.0-Matrix.tar.gz
>  sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
> diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
> index 02b24ef271..50a9147a9d 100644
> --- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
> +++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 8.1.2-Matrix
> +KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 8.2.0-Matrix
>  KODI_PVR_MEDIAPORTAL_TVSERVER_SITE = $(call github,kodi-pvr,pvr.mediaportal.tvserver,$(KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION))
>  KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE = GPL-2.0+
>  KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE_FILES = LICENSE.md
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
