From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 May 2021 14:13:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version
 2.2.1
In-Reply-To: <20210523204447.1105360-1-ju.o@free.fr>
References: <20210523204447.1105360-1-ju.o@free.fr>
Message-ID: <20210524121320.GR3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, All,

On 2021-05-23 22:44 +0200, Julien Olivain spake thusly:
> For change log since v2.2.0, see:
> - https://github.com/FluidSynth/fluidsynth/releases/tag/v2.2.1

Nothing really scary stands out in that release Ino security issue).

> ./utils/test-pkg --package fluidsynth
> 6 builds, 2 skipped, 0 build failed, 0 legal-info failed
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

So: applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/fluidsynth/fluidsynth.hash | 2 +-
>  package/fluidsynth/fluidsynth.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
> index 12620f51c5..08a19e23f8 100644
> --- a/package/fluidsynth/fluidsynth.hash
> +++ b/package/fluidsynth/fluidsynth.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  928fb16f307507485bd1d9b010dafba8c747bce5de2ba47ab1705944c87013b6  fluidsynth-2.2.0.tar.gz
> +sha256  1c56660f23f6c406b36646cc619fc2d2a5265d1d3290e79bcef4505bcd985fdd  fluidsynth-2.2.1.tar.gz
>  sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
> diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
> index b94db61528..1355c06c4a 100644
> --- a/package/fluidsynth/fluidsynth.mk
> +++ b/package/fluidsynth/fluidsynth.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FLUIDSYNTH_VERSION = 2.2.0
> +FLUIDSYNTH_VERSION = 2.2.1
>  FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
>  FLUIDSYNTH_LICENSE = LGPL-2.1+
>  FLUIDSYNTH_LICENSE_FILES = LICENSE
> -- 
> 2.31.1
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
