From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Mar 2021 10:16:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-vuplus: bump version
 to 7.4.2-Matrix
In-Reply-To: <20210326080214.589102-1-bernd.kuhls@t-online.de>
References: <20210326080214.589102-1-bernd.kuhls@t-online.de>
Message-ID: <20210328081632.GG24043@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2021-03-26 09:02 +0100, Bernd Kuhls spake thusly:
> Changelog:
> https://github.com/kodi-pvr/pvr.vuplus/blob/Matrix/pvr.vuplus/changelog.txt
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash | 2 +-
>  package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
> index 8fac6a1770..2439e2619d 100644
> --- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
> +++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  9f10c35477f977646416a0a3f858e95e4dc896436582179981223ccd0570596c  kodi-pvr-vuplus-7.4.1-Matrix.tar.gz
> +sha256  fcd77d5b12def3b6c95928d699460b1dd6b316216f2bd348735261c639113554  kodi-pvr-vuplus-7.4.2-Matrix.tar.gz
>  sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
> diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
> index 22b923bf86..cce260c519 100644
> --- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
> +++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KODI_PVR_VUPLUS_VERSION = 7.4.1-Matrix
> +KODI_PVR_VUPLUS_VERSION = 7.4.2-Matrix
>  KODI_PVR_VUPLUS_SITE = $(call github,kodi-pvr,pvr.vuplus,$(KODI_PVR_VUPLUS_VERSION))
>  KODI_PVR_VUPLUS_LICENSE = GPL-2.0+
>  KODI_PVR_VUPLUS_LICENSE_FILES = LICENSE.md
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
