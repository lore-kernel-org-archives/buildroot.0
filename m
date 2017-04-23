From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Apr 2017 12:17:08 +0200
Subject: [Buildroot] [PATCH v5 29/34] package/kodi-visualisation-*: mass
 version bump
In-Reply-To: <20170417195433.26672-30-bernd.kuhls@t-online.de>
References: <20170417195433.26672-1-bernd.kuhls@t-online.de>
 <20170417195433.26672-30-bernd.kuhls@t-online.de>
Message-ID: <20170423101708.GK7228@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2017-04-17 21:54 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash   | 2 +-
>  package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk     | 2 +-
>  package/kodi-visualisation-goom/kodi-visualisation-goom.hash         | 2 +-
>  package/kodi-visualisation-goom/kodi-visualisation-goom.mk           | 2 +-
>  package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash | 2 +-
>  package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk   | 2 +-
>  package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash | 2 +-
>  package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk   | 2 +-
>  8 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
> index 6a65a58fe..c89ca9a61 100644
> --- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
> +++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256 7047d501942bcd5095e0f1424f003caec8eb792b59d16d16ad25f14829844e50 kodi-visualisation-fishbmc-50c38c296a62e096a2216e43b86d864ee265c506.tar.gz
> +sha256 cf42a21978578cb5ecb10c20fe09791183d8ef2998ff9d956a84142a7dda8f72  kodi-visualisation-fishbmc-v4.1.0.tar.gz
> diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
> index 92c9190ad..d08c215ee 100644
> --- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
> +++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KODI_VISUALISATION_FISHBMC_VERSION = 50c38c296a62e096a2216e43b86d864ee265c506
> +KODI_VISUALISATION_FISHBMC_VERSION = v4.1.0
>  KODI_VISUALISATION_FISHBMC_SITE = $(call github,notspiff,visualization.fishbmc,$(KODI_VISUALISATION_FISHBMC_VERSION))
>  KODI_VISUALISATION_FISHBMC_LICENSE = GPL-2.0+
>  KODI_VISUALISATION_FISHBMC_LICENSE_FILES = visualization.fishbmc/LICENSE
> diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
> index 8507c652a..8d4548a7d 100644
> --- a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
> +++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256 66a71a5c5a1c0016d7020fcc9941634ee465dab14644cdc96023ce0a28408338 kodi-visualisation-goom-16747b7dba9cbdcfdc8df44e849eaf09450fc86f.tar.gz
> +sha256 62a26efb6cd5d5fd109e38accb3deb71145972ae30b914bed7620eb40465c954  kodi-visualisation-goom-v1.1.0.tar.gz
> diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
> index e7695052d..48e042597 100644
> --- a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
> +++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KODI_VISUALISATION_GOOM_VERSION = 16747b7dba9cbdcfdc8df44e849eaf09450fc86f
> +KODI_VISUALISATION_GOOM_VERSION = v1.1.0
>  KODI_VISUALISATION_GOOM_SITE = $(call github,notspiff,visualization.goom,$(KODI_VISUALISATION_GOOM_VERSION))
>  KODI_VISUALISATION_GOOM_LICENSE = GPL-2.0+
>  KODI_VISUALISATION_GOOM_LICENSE_FILES = src/Main.cpp
> diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
> index 18e38f577..6c892ed0b 100644
> --- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
> +++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256 aa417d6ad3d3770029e7d8d9f7f0ca8d56a8a4f47821267b5a8604fc26993334 kodi-visualisation-spectrum-9dbe53a0db73f00ee22e9ca235c98f8137b7bb9e.tar.gz
> +sha256 7ee78ff5c24e3f81b6e2a9208237f34667cb9faa5453d7bdb900ab65245973f1  kodi-visualisation-spectrum-v1.1.1.tar.gz
> diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
> index ebc75779b..3ab2c9975 100644
> --- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
> +++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KODI_VISUALISATION_SPECTRUM_VERSION = 9dbe53a0db73f00ee22e9ca235c98f8137b7bb9e
> +KODI_VISUALISATION_SPECTRUM_VERSION = v1.1.1
>  KODI_VISUALISATION_SPECTRUM_SITE = $(call github,notspiff,visualization.spectrum,$(KODI_VISUALISATION_SPECTRUM_VERSION))
>  KODI_VISUALISATION_SPECTRUM_LICENSE = GPL-2.0+
>  KODI_VISUALISATION_SPECTRUM_LICENSE_FILES = COPYING
> diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
> index 728b857ec..1fdecbede 100644
> --- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
> +++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256 439bd50fcb1c0912532d0d113f7eeadf28f72bd2cb0c234581ee1acc2a70e45b kodi-visualisation-waveform-89aec48e2975f820004df5a1a53801339a5b3064.tar.gz
> +sha256 cf10d8d78cb2bde4a0a21bb7e467445617b46593c093ef05f336f95a048f2d54  kodi-visualisation-waveform-v1.1.0.tar.gz
> diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
> index 2263b7106..d906c653c 100644
> --- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
> +++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KODI_VISUALISATION_WAVEFORM_VERSION = 89aec48e2975f820004df5a1a53801339a5b3064
> +KODI_VISUALISATION_WAVEFORM_VERSION = v1.1.0
>  KODI_VISUALISATION_WAVEFORM_SITE = $(call github,notspiff,visualization.waveform,$(KODI_VISUALISATION_WAVEFORM_VERSION))
>  KODI_VISUALISATION_WAVEFORM_LICENSE = GPL-2.0+
>  KODI_VISUALISATION_WAVEFORM_LICENSE_FILES = COPYING
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
