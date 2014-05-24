From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 24 May 2014 19:42:37 +0200
Subject: [Buildroot] [PATCH] package/rpi-userland: bump version
In-Reply-To: <1400951628-23186-1-git-send-email-yann.morin.1998@free.fr>
References: <1400951628-23186-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CAGduivwu65bSCV0ncJ3fxaiE0AkMh0dbLz7eKAddPG0kUsxONg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a really important commit as it allow us to bump XBMC to
Gotham, this was the main obstacle preventing us from its uses :).

On Sat, May 24, 2014 at 7:13 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Important fix to EGL surface validation.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/rpi-userland/rpi-userland.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
> index 690fd1e..8b225ba 100644
> --- a/package/rpi-userland/rpi-userland.mk
> +++ b/package/rpi-userland/rpi-userland.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -RPI_USERLAND_VERSION = eccb81050afd177da1923404b366c6226f29bfe0
> +RPI_USERLAND_VERSION = 4855a45b118cb7b97b83e5160551db9813487c91
>  RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
>  RPI_USERLAND_LICENSE = BSD-3c
>  RPI_USERLAND_LICENSE_FILES = LICENCE
> --
> 1.8.3.2
>
