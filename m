From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2020 10:36:03 +0200
Subject: [Buildroot] [PATCH/next 1/1] kodi-pvr-nextpvr: bump version to
 3.3.20-Leia
In-Reply-To: <20200522204150.421734-1-bernd.kuhls@t-online.de>
References: <20200522204150.421734-1-bernd.kuhls@t-online.de>
Message-ID: <20200614083603.GH2346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-05-22 22:41 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash | 2 +-
>  package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
> index 4d730deb85..70911a6fcc 100644
> --- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
> +++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256 5f1b7fa00d7248fa840a0e7574bb7714867bff4ad81ceb8ed33cb3aa6d5ccbe9  kodi-pvr-nextpvr-3.3.19-Leia.tar.gz
> +sha256 9f3ce65ece65af05a07ad00a0b8649be0ca1e07d1b1ea964888540c1826852d4  kodi-pvr-nextpvr-3.3.20-Leia.tar.gz
>  sha256 0bd576badce05c6b4315c415dabd77d80c871e72026c399f7a7bb8582e0911fe  debian/copyright
> diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
> index 94461f61d1..59fc274583 100644
> --- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
> +++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KODI_PVR_NEXTPVR_VERSION = 3.3.19-Leia
> +KODI_PVR_NEXTPVR_VERSION = 3.3.20-Leia
>  KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
>  KODI_PVR_NEXTPVR_LICENSE = GPL-2.0+
>  KODI_PVR_NEXTPVR_LICENSE_FILES = debian/copyright
> -- 
> 2.26.2
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
