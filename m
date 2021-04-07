From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 7 Apr 2021 20:44:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-iptvsimple: bump
 version to 7.6.0-Matrix
In-Reply-To: <20210407064428.178777-1-bernd.kuhls@t-online.de>
References: <20210407064428.178777-1-bernd.kuhls@t-online.de>
Message-ID: <9674b090-c4a4-007a-b42a-e3447ee0a0a7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/04/2021 08:44, Bernd Kuhls wrote:
> Release notes:
> https://github.com/kodi-pvr/pvr.iptvsimple/releases/tag/7.6.0-Matrix
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash | 2 +-
>  package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
> index 9170da5bc0..4a9b45999d 100644
> --- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
> +++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  df020ba77864111476c7ab637fa82d658c248723c64d5fd4a31443def60cd75a  kodi-pvr-iptvsimple-7.5.1-Matrix.tar.gz
> +sha256  97cd991b9b6688db1956e853c0af9df7c20cfd645d348f72df2ad1bfc9c23528  kodi-pvr-iptvsimple-7.6.0-Matrix.tar.gz
>  sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
> diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
> index fa14e5677c..51575e76a9 100644
> --- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
> +++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KODI_PVR_IPTVSIMPLE_VERSION = 7.5.1-Matrix
> +KODI_PVR_IPTVSIMPLE_VERSION = 7.6.0-Matrix
>  KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
>  KODI_PVR_IPTVSIMPLE_LICENSE = GPL-2.0+
>  KODI_PVR_IPTVSIMPLE_LICENSE_FILES = LICENSE.md
> 
