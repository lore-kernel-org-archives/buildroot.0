From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 May 2021 08:46:57 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/kodi-peripheral-joystick:
 bump version to 1.7.2-Matrix
In-Reply-To: <20210519045202.7175-1-bernd.kuhls@t-online.de>
References: <20210519045202.7175-1-bernd.kuhls@t-online.de>
Message-ID: <20210519064657.GC2268078@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2021-05-19 06:52 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash | 2 +-
>  package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
> index 650cab0f2d..e85cd19a65 100644
> --- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
> +++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  4dc63c6c5bdad25881eeba800765d97c53b2583addf28e71bbcd67775452ecdb  kodi-peripheral-joystick-1.7.1-Matrix.tar.gz
> +sha256  405acfbcc510f96a48244168362213955357f95cd8b1b92fe1ce483213045bfb  kodi-peripheral-joystick-1.7.2-Matrix.tar.gz
>  sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
> diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
> index 0fdd4851cf..b70f12ce12 100644
> --- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
> +++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KODI_PERIPHERAL_JOYSTICK_VERSION = 1.7.1-Matrix
> +KODI_PERIPHERAL_JOYSTICK_VERSION = 1.7.2-Matrix
>  KODI_PERIPHERAL_JOYSTICK_SITE = $(call github,xbmc,peripheral.joystick,$(KODI_PERIPHERAL_JOYSTICK_VERSION))
>  KODI_PERIPHERAL_JOYSTICK_LICENSE = GPL-2.0+
>  KODI_PERIPHERAL_JOYSTICK_LICENSE_FILES = LICENSE.md
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
